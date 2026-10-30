Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341099;
	b=TaktSf6O4Ld56PoKcGoYnYvIZhyxYQXvdhIn1erHvnpGbTmwDtdVtlZsq9LAOlBjpJpn
	 53zfCTLozfrbFv59p0Uz9e7YjeRXC6V9dbSLQf4z7UDgrvv0TpRzLGMv7egGm+zEojLOM
	 X0GCok3Bx/6aIKAJeB8+Nn3KmeBCzFESJ4n42jejTtBbPofWSBS75WJaWgge4q+b42SSB
	 wSDduEdOgfL3W8LstAdPWP0Be1/SsCC7zCqRxRPMC7XudJzVM/lpfjiaGcSTOC/TPlcqs
	 irx2ReDhXujXbnfHmxrwMmEahnRug98LuB4f+6epbk1peU69ndPLOP/vUxs11kv0Xzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341099;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=eTZV97Ej9NaW0OXMDYyzer66TWfx/oJeH5f1Fz/FjJ8=;
	b=5Xk/wjgOkURAeq7lGtAeJTt0ZLJ08Ir3isAKgvIl7jr6GTN4gctMhdHJQbGM8sKDBnt8
	 XQB/h1Kgyiw6n6ptwbjxbOxRjAS1NsfAiktcBoikBrRsyx6H6VtXwWk84fy0RDJ1AlJjN
	 elZar8X6SsCf4nwt7cSDVo1gzdpMrtACHNz7qvJjRZzoMp9c2dtACECeO8AFGXTrmLOqM
	 YWsVKGBJ6BLflRCeZfWrt8oETs6N3jv/bgjFiKbFK6ijGwMDbCm0e/xNVyYIl1VRzMXXS
	 vgE0Q24pq0biZRAgJWsG55mbBBdwh3J/cWMMlkWWqnQ1SZ1YHoEoNcHWWTnnuB0Yx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TnLoiHvh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD08606A31A
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 06:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TnLoiHvh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793341097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTZV97Ej9NaW0OXMDYyzer66TWfx/oJeH5f1Fz/FjJ8=;
	b=TnLoiHvhdb+UBzvzI/KGoAcpRcqS/jIUS8LiVRSduNTqBznC6M23D+o9CI7LLZkCM7Pdpw
	g4u8If0r/IZEsJ3gFx9CgOAtRa2vwze1UCTevyolN0mxnl8fj2D2d6nKdw4dVIWiN9CXyN
	+ey3wENg0jSDVMM1y5nkcnssJCNEn9Q=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-BhC9HLnqMySz-xypvJNEpA-1; Fri, 30 Oct 2026 02:18:16 -0400
X-MC-Unique: BhC9HLnqMySz-xypvJNEpA-1
X-Mimecast-MFC-AGG-ID: BhC9HLnqMySz-xypvJNEpA_1793341095
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so573531c88.0
        for <nova-gpu@lists.linux.dev>; Thu, 29 Oct 2026 23:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341095; x=1793945895;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eTZV97Ej9NaW0OXMDYyzer66TWfx/oJeH5f1Fz/FjJ8=;
        b=CXZWYnx3KhbTyOjopjOk+ejFC8+aunHC3TrfhFcLPcjV6Eaq67QynKLbc/UIVAHzsb
         eHQ4VMwOYzdnCSNqZZdydrvmdhtbmGO7xmiO2JkhETlUGdhItD7VMv4/d6JuajD8YUP1
         TXhm5OsaVI2qV6Qkp7ciV39opjKpNkFoWePWcF7GZuHyqSELV7c06H9yc/eT2jVhqCiF
         8W258xgud2er3yyil2QmbmIObCUwN5FaxyfNgkLQTurDMdPWfoPSuLhvrEh/LIW2df3u
         gUBBuFPsLm0aKwbIgiZJCgPqMONURZe76ew3mwJTk06Lj591lRl6ZTOM/7vgW0oo9mbI
         YV5A==
X-Forwarded-Encrypted: i=1; AKwUvBx2AD8hjij8qeTnftPqy7dpSg4CNwaPwMmKcaJzsYgJZKMquzP5G5pF7qJ6SgzRAk+jI6gWKvlrqQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKY9l1ssCHvHkDlsx3Wct9qGmDqzxYrOt1koGWzkHnqnK+aO7B8
	rjLaxTIkirTC04alXQaA3WXkhepElfpuw+iI4eduRjxJ2lr6lfo32+GOj5hYA9U7S8KH3viDxxL
	F53DyD5e9Iu10UAOq6abaORlDIHFSUlj6j7jHzYQdg2946V1Go/sHbiaEFGoQPAxeEapojgPz/9
	K9qKanW7/6LOo2z+jjsh1nDZx2d6dsJWnMTWU=
X-Gm-Gg: AYBFou0+xtWSw518SYE1LKEXkHU93nM/MFg3kvsQUXEDmRmUsXeG06cXaHOj3NgkjJX
	VR4pHcob8w7d7iic52ClgIjr+ZBXDddUp8CD43GWJO0c0IQrzOZQsoSUvcMCQR8dgPy0KVR4dgQ
	0g6Kwsram6DnlQ+lsF9IXVrlPByO4fAe3Z60AzvaIp1yCjKKLOYVRzS74el+bh4jjTF+9ouy6Qc
	d83ghgVRxWOkWED
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id a92af1059eb24-1ac59dd07f5mr1814769c88.12.1793341095066;
        Thu, 29 Oct 2026 23:18:15 -0700 (PDT)
X-Received: by 2002:a05:7022:1110:b0:14d:c9e:a356 with SMTP id
 a92af1059eb24-1ac59dd07f5mr1814741c88.12.1793341094352; Thu, 29 Oct 2026
 23:18:14 -0700 (PDT)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-nova-pramin-option-v1-1-d073b3f047fc@redhat.com> <DMHV8ZWTAEVB.YC2XG5BHNBN4@nvidia.com>
In-Reply-To: <DMHV8ZWTAEVB.YC2XG5BHNBN4@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 30 Oct 2026 16:18:02 +1000
X-Gm-Features: AclHuK88iNghoc0nbnd9bSpg2G3pjafRIlnCWpsBWxMaTs6XeV8gBZNH_byemeI
Message-ID: <CAMwc25q7=Sy_yoUdSXU1r-KudqG5wGSkK+9k2E8e7PxGSkqhjg@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: make pramin/buddy optional
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zCPG90pJquuOStyxdn3BuXznO6uToKrhcUQs9lXwi48_1793341095
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> This is related to the comment made by Sashiko, but in which cases are
> we expecting `total_fb_end` to be `None` here? Is this the same set of
> systems for which `buddy_params` will be `None`? If so both arguments
> should be merged into a new type to remove the ability to represent
> invalid state where one is `Some` and the other is `None`.

Indeed I've been working on a patchset to better define the concept
for total_fb_end, so this patchset can work on top in a proper manner.

The question of whether total_fb_end == Some(0) or total_fb_end ==
None is a sufficient indicator for no framebuffer, and I suppose we
have to make a choice before we can land this patch, anyone got an opinion?

> >
> >      /// Access the [`GpuBuddy`] allocator.
> > -    pub(crate) fn buddy(&self) -> &GpuBuddy {
> > -        &self.buddy
> > +    pub(crate) fn buddy(&self) -> Result<&GpuBuddy> {
> > +        self.buddy.as_ref().ok_or(ENODEV)
> >      }
>
> For this kind of accessor to an `Option` it is considered more idiomatic
> to just return an `Option` and let the caller decide how to handle the
> error, but in this case it just seems to be a private convenience method
> used only by submodules, so doing that would defeat its purpose.
> Instead, can we make it private?

possibly, I'll look before resubmitting anything.
>
> <...>
> > diff --git a/drivers/gpu/nova-core/mm/pagetable/map.rs b/drivers/gpu/nova-core/mm/pagetable/map.rs
> > index 77431c509a89..fd404b0734bb 100644
> > --- a/drivers/gpu/nova-core/mm/pagetable/map.rs
> > +++ b/drivers/gpu/nova-core/mm/pagetable/map.rs
> > @@ -81,7 +81,7 @@ pub(super) fn new(pdb_addr: VramAddress) -> Self {
> >      /// Allocate and zero a physical page table page.
> >      fn alloc_and_zero_page(mm: &mut GpuMm<'_>, level: PageTableLevel) -> Result<PreparedPtPage> {
> >          let blocks = KBox::pin_init(
> > -            mm.buddy().alloc_blocks(
> > +            mm.buddy()?.alloc_blocks(
> >                  GpuBuddyAllocMode::Simple,
> >                  SZ_4K.into_safe_cast(),
> >                  Alignment::new::<SZ_4K>(),
> > @@ -94,7 +94,7 @@ fn alloc_and_zero_page(mm: &mut GpuMm<'_>, level: PageTableLevel) -> Result<Prep
> >
> >          // Zero via PRAMIN.
> >          let window = mm
> > -            .pramin_mut()
> > +            .pramin_mut()?
> >              .window_at::<[u64; PAGE_SIZE / 8]>(page_vram)?;
> >          for i in 0..PAGE_SIZE / 8 {
> >              io_write!(window.view(), [build: i], 0);
> > @@ -120,7 +120,7 @@ fn ensure_single_pte_path(
> >          for _ in 0..max_iter {
> >              let result = self
> >                  .walker
> > -                .walk_pde_levels(mm.pramin_mut(), vfn, |install_addr| {
> > +                .walk_pde_levels(mm.pramin_mut()?, vfn, |install_addr| {
> >                      pt_pages.get(&install_addr).and_then(|p| {
> >                          p.alloc
> >                              .iter()
> > @@ -197,7 +197,7 @@ pub(super) fn install_mappings(
> >          writable: bool,
> >      ) -> Result {
> >          {
> > -            let pramin = mm.pramin_mut();
> > +            let pramin = mm.pramin_mut()?;
> >
> >              // Drain prepared PT pages, install all pending PDEs.
> >              let mut cursor = pt_pages.cursor_front_mut();
> > @@ -255,7 +255,7 @@ pub(super) fn invalidate_ptes(
> >          let invalid_pte = M::Pte::invalid();
> >
> >          {
> > -            let pramin = mm.pramin_mut();
> > +            let pramin = mm.pramin_mut()?;
>
> I'll let Eliot comment on this in more depth as I am not very familiar
> with this module, but I'd like to avoid these runtime checks if
> possible. On systems without a framebuffer, we should not even be able
> to call these methods, so I'd like to enforce it at that level.
>
> Ideally, we would consolidate all the state requiring a framebuffer into
> a new type (i.e. my first comment, but pushed further), and put it
> behind a single `Option` that solely tells us whether the system has a
> framebuffer or not. Then methods requiring a framebuffer can be passed a
> reference to that type and work without runtime checking its presence.

I think we have to get to handling instmem maps in bar2 properly
before we can completely encapsulate everything.

Ideally instmem would have one API for allocation and it would be
backed on systems with VRAM with vram allocations, and with dma
allocations on 0-fb systems.

Then we would have to store the instmem backing in some sort of
encapsulation that hides the pramin/vram buddy/bar2 handling and
device handle for dma alloc handling

Does that make sense?

Dave.

