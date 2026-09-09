Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED170583AA9;
	Wed,  9 Sep 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963699; cv=none; b=KJrDcoAWknNj0eI546eA1rBxRmrJM/Mjx9XwsukMYpKqfpM3vjfQj5/L7V0WCpqPPSAB3FkpZ38l+m+L8/bflHEi2jauZ+y5DLFxl2eRBoPCuaiV2bkGW0OvjWHHF7njJSB27tmqqgcirxGpQaZIiU9IQWE3LoUrXPzsUgvZGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963699; c=relaxed/simple;
	bh=u3LQLk1Fga8Uu9bgbWoAgfnIG14OqYfgb+u2suqWZzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpPVa7vhYbNDVsdtYdaBDH/nyZlq8d+xToITKjl1L/rVJn9hUjsMQqU4Iuyly1GRPNVq43p5C1VZkOMkx9fYoCak46Mq4E9pfhDI3wW/ShqABL8i1mCWd7uf+TJNoQ//4pUrUjz6+o5fLeT8hemKJqCgQD5kdgRLs/jx9EjZOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJaI9lOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJaI9lOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF18A1F00A3E;
	Wed,  9 Sep 2026 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963697;
	bh=hLijVf+xRDlxipvZ776I2HCvPwbsHIhjYtsUlH08peI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LJaI9lObJst9uoqN1vYu7Y7bf0HQkv27lDNyvT3u5Z8uVPgp7fUGgYbW2SYhDnDsl
	 zlKPvBwE/E1y4xURDBukUh3KYTrwGd6v9FwMJMTM2xurBrsi9u2wBIuNJKYQ45gKz0
	 GGqK84SpQRnDUl/1BskTNwkB/mCiPgaEBXqUS7FHMjasDC3yR02CrIfC9d7CxVp172
	 1B9gaGxKK3lrDp5wC9lQ0AqwvRMhx1Gy3o/xkS9J6CummKPW5X1Dl8Opi9xu1JRTng
	 JDGZHg9TP8ZywK/g/jlBCj8zU8nyiMVaY+ihhPMvbDQpxeXv4SwT9kMJKucd/5UhNe
	 HwcTYYBWTFc3A==
Message-ID: <dcc557f2-b537-45a6-ad55-3af5fdbf9f7f@kernel.org>
Date: Wed, 9 Sep 2026 16:21:33 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for
 MapleTree
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl
 <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, maple-tree@lists.infradead.org,
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
References: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260908-maple-tree-send-sync-v2-1-24aae5b3a990@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 11:54 AM, Eliot Courtney wrote:
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
> ---
> This is a repost of Joel's v3 [1]. The upcoming nova-core memory
> management changes depend on it.
> 
> Compared to v3, I've added Boqun's Reviewed-by from the v2 thread [2],
> which v3 didn't pick up.
> 
> This is based on drm-rust-next.

Acked-by: Danilo Krummrich <dakr@kernel.org>
