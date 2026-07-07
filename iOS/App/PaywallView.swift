import SwiftUI

struct PaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var purchases: PurchaseManager

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()
                VStack(spacing: 20) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(Theme.accent)
                    Text("Clay Book - Polymer Clay Log Pro")
                        .font(Theme.title())
                        .foregroundStyle(Theme.ink)
                    Text("Cane recipe library with color-ratio photos for repeat builds")
                        .font(Theme.body())
                        .foregroundStyle(Theme.ink.opacity(0.75))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    if let product = purchases.product {
                        Button {
                            Task { await purchases.purchase() }
                        } label: {
                            Text("Subscribe \(product.displayPrice)/mo")
                                .font(Theme.label(16))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Theme.accent)
                                .foregroundStyle(Theme.background)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .accessibilityIdentifier("subscribeButton")
                        .padding(.horizontal)
                    }
                    Button("Restore Purchases") {
                        Task { await purchases.restore() }
                    }
                    .accessibilityIdentifier("paywallRestoreButton")
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                        .accessibilityIdentifier("paywallCloseButton")
                }
            }
        }
    }
}
