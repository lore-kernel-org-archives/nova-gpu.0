Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B135200F;
	Tue,  8 Sep 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891754; cv=none; b=FnsPldvCXFuegC66qUNlii2dtwMSpAPXhoNV97/Hu/efVMztQ7rFFfoYDVYu4ArTmmDWYvKLGkjFUEyBUeUeXdaS1xhj+BJXaY4psDG3ZKc2CiGMvEdsjKabXFkJ6vnw6UYFRNAdNr2UlswlUUPKtrdw+H4Cp//0aUtjOEWBME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891754; c=relaxed/simple;
	bh=xPuSMZJqjAF33vsPdH/D84xjTnIL+xJcL+cp6YngebE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4vR+McYIoJgYeeKZ1rFwiGVlxHQ4WRz4sz/92w4bApOoN2aAy/YQ2PjUprtAdrjZJPTAw65XlnTgtOdogFhUHGNnQHlRCnBHom9ZgFqQaZedV8fPbon7IYrj6ZskfPmgDWmB/e6i0b5Ks2Xu+UrfxcvKIwtY8NzL7HOD1IpZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lWFkVQ1W; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lWFkVQ1W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5slKt7OcHIIgNLR2zoIZ2Xkvk5tkSJNvbMwK4ZOzd9s=; b=lWFkVQ1WBxekoxef1ijFWsp6qw
	vDG6ZW9iGsUld/caSpmh/gjmRAGIn8CPerKfYhrZweTUU1kt90397Mwctm8NOLI58RZ8dgws84rVv
	MCdW8gUiD1M9TXNKKGM1mguVGInjew6s1ejveqcacnNWf2ApOXHl3MEgAqfSKUbs81jS2yD3ZrnWQ
	zgecBG6GJFMO5BIJjUhvNDvRsRrwyDE8W3QRnFVOFaUkOreRncz8aq4tw+lmZGkt9AaF86AUkyk/0
	2FtMFvmhjH8Lf/GOt+xpynujFn6R5n4t2AlaKu827dlNOQ2dZeWs4OJ1u+1n7nwx0kbemZ0hMP9B1
	yWX0fd2Q==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40Sh-00000009xrk-2S6W;
	Tue, 08 Sep 2026 18:22:27 +0000
Date: Tue, 8 Sep 2026 14:22:25 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>, Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for
 MapleTree
Message-ID: <h3nctzhusfbtxubn63h5nydns6c7o2yshadszxzzagnltc5k47@7cbg2nbh7tsc>
References: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>

On 26/09/08 06:54PM, Eliot Courtney wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> The C maple_tree struct contains a *mut c_void, which prevents Rust from
> auto-deriving Send/Sync. Following is an example error message when using
> MapleTree in nova-core's Vmm.
> 
> This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
> causing NovaCore to fail the Send bound required by pci::Driver:
> 
>   error[E0277]: `*mut c_void` cannot be sent between threads safely
>       --> drivers/gpu/nova-core/driver.rs:77:22
>        |
>   77   | impl pci::Driver for NovaCore {
>        |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
>        |
>        = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
>   note: required because it appears within the type `kernel::bindings::maple_tree`
>   note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
>   note: required because it appears within the type `MapleTree<()>`
>   note: required because it appears within the type `MapleTreeAlloc<()>`
>        = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
>   note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
>   note: required because it appears within the type `Vmm`
>   note: required because it appears within the type `BarUser`
>   note: required because it appears within the type `Gpu`
>   note: required because it appears within the type `NovaCore`
>   note: required by a bound in `kernel::pci::Driver`
>       --> rust/kernel/pci.rs:294:19
> 
> Implement Send and Sync for MapleTree. The tree contains no thread-local
> state, and all shared access goes through the internal ma_lock spinlock.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> [ecourtney: also require T: Sync for the Sync impl]
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Acked-by: Liam R. Howlett (Oracle) <liam@infradead.org>

> ---
> This is a repost of Joel's v3 [1]. The upcoming nova-core memory
> management changes depend on it.
> 
> Compared to v3, I've added Boqun's Reviewed-by from the v2 thread [2],
> which v3 didn't pick up.
> 
> This is based on drm-rust-next.
> 
> [1] https://lore.kernel.org/all/20260511143604.3848176-1-joelagnelf@nvidia.com/
> [2] https://lore.kernel.org/all/aftiZGt3HQe0Bf_x@tardis.local/
> [3] https://lore.kernel.org/all/CAH5fLgh_TQiqKxXsz_DVcQxkCaEw+q0JyTh4e4Tnp28V0JDmYg@mail.gmail.com/
> ---
> Changes in v2:
> - Also require `T: Sync` for the `Sync` impl, so that shared borrows of
>   entries (e.g. future RCU readers) are sound [3]. (Alice)
> - Kept Reviewed-by tags since e.g. Boqun also suggested the same `Sync`
>   change [4] and Gary was asking around the same kind of thing [5]
> - Link to v1: https://patch.msgid.link/20260908-maple-tree-send-sync-v1-1-43adcd4a16e8@nvidia.com
> 
> [4] https://lore.kernel.org/all/aepRx2jgIKmoRp-r@tardis.local/
> [5] https://lore.kernel.org/all/DHYYDQWP4FZ7.3MK090FH4HWID@garyguo.net/
> ---
>  rust/kernel/maple_tree.rs | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> index 265d6396a78a..7abe41228cb7 100644
> --- a/rust/kernel/maple_tree.rs
> +++ b/rust/kernel/maple_tree.rs
> @@ -16,7 +16,11 @@
>      alloc::Flags,
>      error::to_result,
>      prelude::*,
> -    types::{ForeignOwnable, Opaque},
> +    types::{
> +        ForeignOwnable,
> +        NotThreadSafe,
> +        Opaque, //
> +    },
>  };
>  
>  /// A maple tree optimized for storing non-overlapping ranges.
> @@ -240,7 +244,10 @@ pub fn lock(&self) -> MapleGuard<'_, T> {
>          unsafe { bindings::spin_lock(self.ma_lock()) };
>  
>          // INVARIANT: We just took the spinlock.
> -        MapleGuard(self)
> +        MapleGuard {
> +            tree: self,
> +            _not_send: NotThreadSafe,
> +        }
>      }
>  
>      #[inline]
> @@ -302,19 +309,30 @@ fn drop(mut self: Pin<&mut Self>) {
>      }
>  }
>  
> +// SAFETY: `MapleTree<T>` is `Send` if `T` is `Send` because `MapleTree` owns its elements.
> +unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
> +
> +// SAFETY: `&MapleTree<T>` allows inserting and erasing entries from any thread, so `T: Send` is
> +// required, and shared borrows of entries require `T: Sync`.
> +unsafe impl<T: ForeignOwnable + Send + Sync> Sync for MapleTree<T> {}
> +
>  /// A reference to a [`MapleTree`] that owns the inner lock.
>  ///
>  /// # Invariants
>  ///
>  /// This guard owns the inner spinlock.
>  #[must_use = "if unused, the lock will be immediately unlocked"]
> -pub struct MapleGuard<'tree, T: ForeignOwnable>(&'tree MapleTree<T>);
> +pub struct MapleGuard<'tree, T: ForeignOwnable> {
> +    tree: &'tree MapleTree<T>,
> +    // A held spinlock must be released on the same CPU that acquired it.
> +    _not_send: NotThreadSafe,
> +}
>  
>  impl<'tree, T: ForeignOwnable> Drop for MapleGuard<'tree, T> {
>      #[inline]
>      fn drop(&mut self) {
>          // SAFETY: By the type invariants, we hold this spinlock.
> -        unsafe { bindings::spin_unlock(self.0.ma_lock()) };
> +        unsafe { bindings::spin_unlock(self.tree.ma_lock()) };
>      }
>  }
>  
> @@ -323,7 +341,7 @@ impl<'tree, T: ForeignOwnable> MapleGuard<'tree, T> {
>      pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
>          // SAFETY: The `MaState` borrows this `MapleGuard`, so it can also borrow the `MapleGuard`s
>          // read/write permissions to the maple tree.
> -        unsafe { MaState::new_raw(self.0, first, end) }
> +        unsafe { MaState::new_raw(self.tree, first, end) }
>      }
>  
>      /// Load the value at the given index.
> @@ -375,7 +393,7 @@ pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
>      #[inline]
>      pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
>          // SAFETY: `self.tree` contains a valid maple tree.
> -        let ret = unsafe { bindings::mtree_load(self.0.tree.get(), index) };
> +        let ret = unsafe { bindings::mtree_load(self.tree.tree.get(), index) };
>          if ret.is_null() {
>              return None;
>          }
> 
> ---
> base-commit: e6a2c988ed96a5a3af51ed97ecba980521bf2fc0
> change-id: 20260907-maple-tree-send-sync-a1479d1ab302
> 
> Best regards,
> --  
> Eliot Courtney <ecourtney@nvidia.com>
> 
> 
> -- 
> maple-tree mailing list
> maple-tree@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/maple-tree
