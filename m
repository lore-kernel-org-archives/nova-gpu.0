Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0423B42E4;
	Wed,  9 Sep 2026 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982341; cv=none; b=BSjbpqXU7tK6Um80tQHOrorAjisgVaVh16HDebIYvdWtmycOuesgYGWnhw9lRq8ibbBChiN01GL61uSpDecAJhZ2RMoq2bvaT6yuoHo8gFguqNtkowZRmAb9/63uBncGunf75Cy76IjevhM4DYQXnvd1PGXxsyNz4pdFfdCs/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982341; c=relaxed/simple;
	bh=cKrRRiO5Tyc5Uc4YrpyEX0hUYuDBDtac832e+2PBohU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=VIzIQJAIWC0hFuS36hw+YWvTrk+hBCNwQ6980Wj2yUw79OR9v3Ues+U5S8ot1a0y3HornTzydrFdBj6kTiJV7WmbbwRgVo323xMWUDu0xwSfkM+zvcFX39Uo57Hmy3OwKJ/CJjJ712/HN+7rMYLr2y118MIick9fgLTMAlNIPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeuPo+mU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeuPo+mU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296FF1F000FF;
	Wed,  9 Sep 2026 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788982340;
	bh=iZEHL6pVrI/BzY3wjrvCxOeC03FbPw9Q5Y/ACpSgxVc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=eeuPo+mUwZs+hWs7gzi2JhWZ/nC8TkX+sgZshtXD6kkOYZv9lUQXxE8Ggjslh+cFs
	 OXpgpHF8xnaU/78pS9zqh+6VZzmpl5s4++n5hjQwmc6O52KvucBcRP4veEdoylWghI
	 FPayZusPmbt5qCZxExsJ8vXrNEsjq6wZpqMNTR01OpN9oCQX00okoDQtSSR5L3Pke/
	 O+hw0jIo5PFtnXXzxESYZLjT4vKh8FoUihrjxI57MEpvEWJjcUpuDSCfP/i7rANibM
	 E/YiwhkNxV9kF91px5vW2ASfurL9PPFzXFBs2QLEY6ywCPESvU9UsXys5ihYTk8kKR
	 0vpfsXIBZdWDQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 21:32:16 +0200
Message-Id: <DLB1B7PEYAGM.1QXBLANWRJJBL@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 12/16] gpu: nova-core: mm: Add virtual address range
 tracking to VMM
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
 <20260909-mmrebase-v1-12-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-12-8dd5d4225d2e@nvidia.com>

On Wed Sep 9, 2026 at 5:59 AM CEST, Eliot Courtney wrote:
> +    /// Allocate a contiguous virtual frame number range.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// - `num_pages`: Number of pages to allocate.
> +    /// - `va_range`: `None` =3D allocate anywhere, `Some(range)` =3D co=
nstrain allocation to the given
> +    ///   range.
> +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u=
64>>) -> Result<Vfn> {
> +        let page_size: u64 =3D PAGE_SIZE.into_safe_cast();
> +
> +        let start_vfn =3D match va_range {
> +            Some(r) =3D> {
> +                let num_pages_u64: u64 =3D num_pages.into_safe_cast();
> +                let size =3D num_pages_u64.checked_mul(page_size).ok_or(=
EOVERFLOW)?;
> +                let range_size =3D r.end.checked_sub(r.start).ok_or(EOVE=
RFLOW)?;
> +                if range_size !=3D size {
> +                    return Err(EINVAL);
> +                }
> +                let start_vfn: usize =3D (r.start / page_size).into_safe=
_cast();
> +                let end_vfn: usize =3D (r.end / page_size).into_safe_cas=
t();
> +                self.virt_alloc
> +                    .insert_range(start_vfn..end_vfn, (), GFP_KERNEL)?;
> +                start_vfn
> +            }
> +            None =3D> self
> +                .virt_alloc
> +                .alloc_range(num_pages, (), ..self.va_pages, GFP_KERNEL)=
?,
> +        };
> +
> +        Ok(Vfn::new(start_vfn.into_safe_cast()))
> +    }
> +
> +    /// Free a virtual frame number range back to the maple tree.
> +    fn free_vfn(&self, vfn: Vfn) {
> +        let vfn_index: usize =3D vfn.raw().into_safe_cast();
> +        if self.virt_alloc.erase(vfn_index).is_none() {
> +            kernel::pr_warn!("free_vfn: VFN {} not found in maple tree\n=
", vfn_index);
> +        }
> +    }

Ick! I think this should be done with a guard type, e.g.

	struct AllocatedVfnRange<'a> {
	    vfn_start: Vfn,
	    virt_alloc: &'a MapleTreeAlloc<()>,
	}

Now, I get that this isn't done because the whole Vmm is within a Mutex and
hence it would tie its lifetime to the MutexGuard.

But, Vmm shouldn't be embedded in a Mutex in the first place, as it defeats=
 the
whole purpose of having the prepare_map() and execute_map() split.

Requiring the same lock for execute_map() as for prepare_map() will pull a
memory reclaim path into the DMA fence signaling critical path.
