Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2F352029
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968181; cv=none; b=BAcMeJ9z73ZivGjQk4JhGAOBSFphqQwkSF4WRBxoIdYJlUX7tWsArj0VJSRtY5k2LUovTLDxDRtijTZijNtDNgLsEd+zPJHEMBVlt/h3K5QWeP9NI2nQXCpjPiMjdnFb6J/cpuGllmjtB1s/pZKTp4cK/g4PqFg5QRze/6gsF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968181; c=relaxed/simple;
	bh=qUkknTqM3wAsDZGxnCk4r8uije4Ywksk31AJGFUwoio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg1bntLrpTKuDmGj6fgIsrQzpkfdYqMvoa6pN6fJlxIQH8tMlV/95Tp6RqSE6vJ+BMinmCGWwXQkcHAjWaccJAC9PU+J0mJJgHI1FQfVgmg8XYRMdDWhZTT3pkwvVNZQvjXEsZnDK8cTZofLeuQXhqota4ImZxU6uxgMOFHlRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhNyVchm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhNyVchm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ABC1F00A3D;
	Thu,  2 Jul 2026 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782968180;
	bh=5FbdgVVCy1jGRJo4ul6m4avfjzpDyG/ZQhvkhAXSZdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhNyVchmjhlHqs+11k03JwG9AM8v2cmiR34mgIKLhP0kXuV2QU94MFPIUDJw4Iqo/
	 CsS+7AIk3qvqAjDcbjovb8Q5mqWwjnRt2AGO1/W5R7LJKAwIUndZV2d3LPCKwEcMeB
	 dPCSiUUTgwbEv4WlEjhtxRpglabrdOYM/ypBDCd4XmjDOzC3povRemtUdcbMpJJbK0
	 ZkcCq06MbDfdcILP1pQxrio6oTPURshau5ZFwmkAwgtejXESNgYoS5kO1hp5PN3pmT
	 KRg8nLkJK5zU9vwyxQY+GRAkIcG2v9AGDlgKuZjEKNPyz4BBGyBRAi4eYcYipqXEtv
	 qcZjEZCqmPsaw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A6394F40074;
	Thu,  2 Jul 2026 00:56:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 02 Jul 2026 00:56:18 -0400
X-ME-Sender: <xms:cu9Faipocy07PwM0BMQo6FTFxRsAxfX2pUAdktPMN9qcTQBBXQtn9Q>
    <xme:cu9FahGsD8LzNpD0Oh5RvHvsTzVLY9MCt28Mijdt2obSkHVeTtyZmJIaEZM6A8rD6
    EUo3IaHh5y98HNIIReXqIYc1zqH74M1kKBfHVz0aTDEgV253cu2Zw>
X-ME-Received: <xmr:cu9FauHLwe3FnkwAYe2bksGhXbQEICCkqGTZVyQ3Si-USIJGICL5Qhs-YmNq08sWiKYoKMqPzx3LUZsqZ-XoUtCUuarI7eO6>
X-ME-Proxy-Cause: dmFkZTFJK+qC8Nw8QEmP6/3rDThTwyuB46e6V2yMR2v0UJoWpC1gb/Ej7QeegI3skXjY3V
    StH+oMB43R2Lzr7nm8zsf1GbY6RHyo93FdKXx5GZxUfSHN2TOfDchyVY4B6a7Mp4twDbtp
    CVsUJH1Q9q+lHVUoJhfoSy1JYEVYUi9FHBHIKlaax9Soxva4B6Xsmiq/eAybqL9IVSB0r/
    wWTF95StWJxuQDLenlUnI9ooS68AJec0IADaG4p29nDovJhym/d151AKn2pyWvLaia/Cfk
    5hbneZXgexxtz/ZvVNgnoUvBekzqxVJ71RkyLz+P7kCk6iTGQD49YS7R3vDkEzzncVTFqP
    A30SqjHKVGj/BRr6bCGykTdwC35NMSfBzYo8mnI3wFpS7tHkmYSwq7S1vx2LPr8OimvfZt
    feTK0Wds8vq6bRsPAvZNJPA++Jb1OLbckEfbz4nd885/DClpIRYR5pb4124dTnJbwX48sV
    bswITlzNMwZA9OpGL8FxN9iXw6SQGyMIDz0TxBZpJvKXYn+1CSXwoe7anv2i0UfGrJr4gY
    zOuDM10mcSHn3vkTtf3kpStr2jbBAVYL1WEVGGRnya6SOOug7ZUr3rS1hUqaTMGryzD6Lc
    y6zzqwuEUiiKXnRD7OPq7c5/4l6Zh4b1Vt7lAVtaEOer4lAaJIEj0raT5JqA
X-ME-Proxy: <xmx:cu9FaoJkL8GRnA0t7f2Os5kxwkjRUJAVlszp8XoTrEMu274AjyJN2w>
    <xmx:cu9FavFRJzsQ88A0-WpGjExho1YknygXE8w7J7R1QVDcdzXXN8nZiw>
    <xmx:cu9Fahqf-9WQh82Mx4ij6FmhSf4bNi-mZrBwI14sA71wMhIJkh03kg>
    <xmx:cu9FatMR2sEd4nYgf_0bPB7-J3SMaCV_IeFi98DrhLByTde_iMnclw>
    <xmx:cu9FapoL7ru2LeQJ4wszTKVs_VwFuOkMv1z8PY2UuRuNNU5O5HbE4LYN>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 00:56:18 -0400 (EDT)
Date: Wed, 1 Jul 2026 21:56:17 -0700
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,	nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,	lkmm@lists.linux.dev
Subject: Re: [PATCH v2 2/4] rust: sync: generic memory barriers
Message-ID: <akXvcdhEN8Rk7QaJ@MacBook-0RXW5>
References: <20260609-rust-barrier-v2-0-30fcc48e1cd0@garyguo.net>
 <20260609-rust-barrier-v2-2-30fcc48e1cd0@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-rust-barrier-v2-2-30fcc48e1cd0@garyguo.net>

On Tue, Jun 09, 2026 at 04:38:38PM +0100, Gary Guo wrote:
> Implement a generic interface for memory barriers (full system/DMA/SMP).
> The interface uses a parameter to force user to specify their intent with
> barriers.
> 
> Provide `Read`, `Write`, `Full` orderings which map to the existing
> `rmb()`, `wmb()` and `mb()`. Generic is used here instead of providing
> individual standalone functions to reduce code duplication; for example,
> the `CONFIG_SMP` check in `smp_mb` is uniformly implemented for all SMP
> barriers. This could extend to `virt_mb`'s if they're introduced in the
> future. It would also make it easier if new ordering types are introduced
> in the future (e.g. `Acquire`, `Release`).
> 

Queued with minor changes:

* Added "Add" into the commit title.
* Applied vertical import style.

But I do want to get more memory model reviews on this patch series, so
please do take a look if you're interested ;-)

Regards,
Boqun

> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/sync/atomic/ordering.rs |   2 +-
>  rust/kernel/sync/barrier.rs         | 123 ++++++++++++++++++++++++++++--------
>  2 files changed, 96 insertions(+), 29 deletions(-)
> 
> diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
> index 3f103aa8db99..c4e732e7212f 100644
> --- a/rust/kernel/sync/atomic/ordering.rs
> +++ b/rust/kernel/sync/atomic/ordering.rs
> @@ -15,7 +15,7 @@
>  //!   - It provides ordering between the annotated operation and all the following memory accesses.
>  //!   - It provides ordering between all the preceding memory accesses and all the following memory
>  //!     accesses.
> -//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb()`).
> +//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb(Full)`).
>  //! - [`Relaxed`] provides no ordering except the dependency orderings. Dependency orderings are
>  //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
>  //!
> diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
> index 8f2d435fcd94..54c527fdb760 100644
> --- a/rust/kernel/sync/barrier.rs
> +++ b/rust/kernel/sync/barrier.rs
> @@ -7,6 +7,34 @@
>  //!
>  //! [`LKMM`]: srctree/tools/memory-model/
>  
> +#![expect(private_bounds, reason = "sealed implementation")]
> +
> +/// Memory barrier orderings.
> +///
> +/// The semantics of these orderings follows the [`LKMM`] definitions and rules.
> +///
> +/// - [`Read`] provides ordering between preceding load operations and succeeding load operations.
> +/// - [`Write`] provides ordering between preceding store operations and succeeding store
> +///   operations.
> +/// - [`Full`] provides ordering between all the preceding memory accesses and succeeding memory
> +///   accesses.
> +///
> +/// [`LKMM`]: srctree/tools/memory-model/
> +pub mod ordering {
> +    pub use crate::sync::atomic::ordering::Full;
> +
> +    /// The annotation type for read-read barrier ordering.
> +    pub struct Read;
> +
> +    /// The annotation type for write-write barrier ordering.
> +    pub struct Write;
> +}
> +
> +pub use ordering::{Full, Read, Write};
> +
> +struct Smp;
> +struct Dma;
> +
>  /// A compiler barrier.
>  ///
>  /// A barrier that prevents compiler from reordering memory accesses across the barrier.
> @@ -19,43 +47,82 @@ pub(crate) fn barrier() {
>      unsafe { core::arch::asm!("") };
>  }
>  
> -/// A full memory barrier.
> +trait MemoryBarrier<Flavour = ()> {
> +    fn run();
> +}
> +
> +macro_rules! define_barrier {
> +    ($([$flavour:ident])? $ordering:ident, $binding:ident) => {
> +        impl MemoryBarrier$(<$flavour>)? for $ordering {
> +            #[inline]
> +            fn run() {
> +                // SAFETY: barrier methods are safe to call.
> +                unsafe { bindings::$binding() };
> +            }
> +        }
> +    };
> +}
> +
> +define_barrier!(Full, mb);
> +define_barrier!(Read, rmb);
> +define_barrier!(Write, wmb);
> +define_barrier!([Dma] Full, dma_mb);
> +define_barrier!([Dma] Read, dma_rmb);
> +define_barrier!([Dma] Write, dma_wmb);
> +define_barrier!([Smp] Full, smp_mb);
> +define_barrier!([Smp] Read, smp_rmb);
> +define_barrier!([Smp] Write, smp_wmb);
> +
> +/// Memory barrier.
>  ///
>  /// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> -#[inline(always)]
> -pub fn smp_mb() {
> -    if cfg!(CONFIG_SMP) {
> -        // SAFETY: `smp_mb()` is safe to call.
> -        unsafe { bindings::smp_mb() };
> -    } else {
> -        barrier();
> -    }
> +///
> +/// The specific forms of reordering can be specified using the parameter.
> +/// - `mb(Read)` provides a read-read barrier.
> +/// - `mb(Write)` provides a write-write barrier.
> +/// - `mb(Full)` provides a full barrier.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use kernel::sync::barrier::*;
> +/// mb(Read);
> +/// mb(Write);
> +/// mb(Full);
> +/// ```
> +#[inline]
> +#[doc(alias = "rmb")]
> +#[doc(alias = "wmb")]
> +pub fn mb<T: MemoryBarrier>(_: T) {
> +    T::run()
>  }
>  
> -/// A write-write memory barrier.
> +/// Memory barrier between CPUs.
>  ///
> -/// A barrier that prevents compiler and CPU from reordering memory write accesses across the
> -/// barrier.
> -#[inline(always)]
> -pub fn smp_wmb() {
> +/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> +/// Does not prevent re-ordering with respect to other bus-mastering devices.
> +///
> +/// See [`mb`] for usage.
> +#[inline]
> +#[doc(alias = "smp_rmb")]
> +#[doc(alias = "smp_wmb")]
> +pub fn smp_mb<T: MemoryBarrier<Smp>>(_: T) {
>      if cfg!(CONFIG_SMP) {
> -        // SAFETY: `smp_wmb()` is safe to call.
> -        unsafe { bindings::smp_wmb() };
> +        T::run()
>      } else {
> -        barrier();
> +        barrier()
>      }
>  }
>  
> -/// A read-read memory barrier.
> +/// Memory barrier between local CPU and bus-mastering devices.
>  ///
> -/// A barrier that prevents compiler and CPU from reordering memory read accesses across the
> -/// barrier.
> -#[inline(always)]
> -pub fn smp_rmb() {
> -    if cfg!(CONFIG_SMP) {
> -        // SAFETY: `smp_rmb()` is safe to call.
> -        unsafe { bindings::smp_rmb() };
> -    } else {
> -        barrier();
> -    }
> +/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> +/// Does not prevent re-ordering with respect to other CPUs.
> +///
> +/// See [`mb`] for usage.
> +#[inline]
> +#[doc(alias = "dma_rmb")]
> +#[doc(alias = "dma_wmb")]
> +pub fn dma_mb<T: MemoryBarrier<Dma>>(_: T) {
> +    T::run()
>  }
> 
> -- 
> 2.54.0
> 
