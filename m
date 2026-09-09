Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C1388E74;
	Wed,  9 Sep 2026 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983904; cv=none; b=u0fv//3mEugK6A8MYdGdDK3ciwi2pWaKdyHG+HrmbgthPc4F7YA5xtE/KOzorjr5GS+sW9piS+9Xc+qgHysOVPjr9B11ZSEtSCVx4wpOwTCX2fso9SkVs0FIBjelD7r/RbX/fbTy2Ut5QnP90UkfZfz9xxuKe+OQYiqLb2b5ZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983904; c=relaxed/simple;
	bh=u+tHxbZy2QcNu3Nhj2egBba2i/1PeEhbM9jL4eMTUZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Av7NtJhAxuGPHIuZxW7/j4uOVVZVtTu7pE9NZTXDb06wbCpsWcfIgOCRiIJTWSFfr9wVU8P/Lfc7HcZ9DSu3t0DL9Q7fbr9V6XK9leXAiUByT50X+OhBiW2TUBF9SxIBpb3pJPECYPL3J6jJPWf0oarENCWAC8s0KD6YpM+SQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGe16ty3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGe16ty3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810FD1F000FF;
	Wed,  9 Sep 2026 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983902;
	bh=8p6j3WcTxfgnMkyJv6HcGBKIF4vs2kbNBLNSDowvboU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=mGe16ty3mzoCXfYK7oBRMR1VUzKWMXMnUfVciTGIhKCiNCPtCl9K/xutdqozmhDst
	 WLkXlwwRryRWjwrIKpq6t/0w9M/XFtPhqbfoOUDUrTCphHI5ynbLo/NqGXqfMEjctJ
	 b3jrLnaEm9q6f4cDltL/f3WXT3Hme3a/gqepPBVkWNlXccSVOo/GB4phsR9G0iA71c
	 hLu4VlSpHQPRYLr51grcmMFlfVAMqcXWb91N/h9TDmR5NPTHi50LO4HEhMZEx/zQB1
	 CJEFgu2+1Qk3ytGqW2pgrs4vLvsLuiM8zoq1r/pTmrWmboxlhfeHnALVlFUpRGW4+v
	 MAKD3SKWhNIZw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 21:58:18 +0200
Message-Id: <DLB1V5CJKOGW.35IM2Z2N6SP7K@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 13/16] gpu: nova-core: mm: Add multi-page mapping API to
 VMM
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
 <20260909-mmrebase-v1-13-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-13-8dd5d4225d2e@nvidia.com>

On Wed Sep 9, 2026 at 5:59 AM CEST, Eliot Courtney wrote:
> +/// Guard that logs a warning if a [`PreparedMapping`] is dropped withou=
t
> +/// being consumed by [`Vmm::execute_map()`].
> +struct MustExecuteGuard {
> +    armed: Cell<bool>,
> +}
> +
> +impl MustExecuteGuard {
> +    const fn new() -> Self {
> +        Self {
> +            armed: Cell::new(true),
> +        }
> +    }
> +
> +    fn disarm(&self) {
> +        self.armed.set(false);
> +    }
> +}
> +
> +impl Drop for MustExecuteGuard {
> +    fn drop(&mut self) {
> +        if self.armed.get() {
> +            kernel::pr_warn!("PreparedMapping dropped without calling ex=
ecute_map()\n");
> +        }
> +    }
> +}
> +
> +/// Guard that logs a warning if a [`MappedRange`] is dropped without
> +/// calling [`Vmm::unmap_pages()`].
> +struct MustUnmapGuard {
> +    armed: Cell<bool>,
> +}
> +
> +impl MustUnmapGuard {
> +    const fn new() -> Self {
> +        Self {
> +            armed: Cell::new(true),
> +        }
> +    }
> +
> +    fn disarm(&self) {
> +        self.armed.set(false);
> +    }
> +}
> +
> +impl Drop for MustUnmapGuard {
> +    fn drop(&mut self) {
> +        if self.armed.get() {
> +            kernel::pr_warn!("MappedRange dropped without calling unmap_=
pages()\n");
> +        }
> +    }
> +}

As mentioned in the previous reply, none of this seems necessary if we get =
rid
of the big vmm lock and use proper RAII guards instead.

> +        // TODO: Internal page table pages (PDE, PTE pages) are still ke=
pt around.
> +        // This is by design as repeated maps/unmaps will be fast. As a =
future TODO,

So, if I got the math right it means that once we scattered mappings across=
 1TiB
of address space, this is 2GiB of VRAM gone given that we currently only ha=
ve
4KiB pages?

Performance wise it depends on the reclaim strategy. Also, given that we ha=
ve no
software mirror, isn't this N * 4 PRAMIN reads for a mapping of N pages?

So, I'm not sure I'd call this by design.

> +        // we can add a reclaimer here to reclaim if VRAM is short. For =
now, the PT
> +        // pages are dropped once the `Vmm` is dropped.
