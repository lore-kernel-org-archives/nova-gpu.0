Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792424628;
	b=NqAGh2+YHlwtgmAjfsRqqa04I+OTfqILJHYigZ2gAGBKZ2BIXiU7IamcsxxptUlFResn
	 fU/HKSDOIvvXku+VyIKe0lKV8svr1aCQsp06aQUPiiEg3nFhyz1JTzC1VxQJyHqKZzN2u
	 4tZifjg3F8cQ63zc17c3Qhq89st51vL6ehNZcrzuMsRN91juI3TQj0crqtYBWeF9PkxuK
	 Hk/dnUYIdO5NkR0xsKjYbk0XiKkf6iwk8wkLEMx0+1LHst5zPEiuSlQxzfRY43YV557Nx
	 0UPG7tUWhfHPesw0G6EwI64Ny+O++4MdMiooYwgfawHvKZscMemYXlW/kaVNaGTYTFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
	b=B36/mr/Ww9ZIUCQCKgSqO6GOVC/D8XJ3x+7mZetuSygHBo1OxYZVPVxOWD4nlBEJX7Md
	 Gmv0Ei6nifOEzIxCLRQF40xjSB0xbxbsLXEE+bUiai5bLkS20n85pb5zS/Bw2L+2kylCP
	 NrWQrS80ukH9Ng3CY7iF2KQgY3b/A8QQHbvZUi4ObiLX/Yn91d4PjhPnxYsBy40xFx4L5
	 dK7E+0qKeNHNfxP8OpQ1/iMgaGWCsErcfIN3xY+Q1u+NrGi1S3R/PG7J3mXi798oQVn5R
	 dQZh4N2wB4ZRdBveZ5t1o/fYj74ljx4xwBzMSFCLkZKat3cnXvyyyQcaMvc4pmvJG0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=gfxstrand.net;
	spf=fail smtp.mailfrom=gfxstrand.net;
	dkim=pass header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=I5zMYMFj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115FB606AAD8
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 15:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115FB606AAD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=I5zMYMFj
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15dd124bbe7so4195412c88.1
        for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 08:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792424626; cv=none;
        d=google.com; s=arc-20260327;
        b=EFWsbYC4Dfwh4HhSQkVuK3dkfRgJ3W2+TU97LNSomdcq8j8ELuPZwhYnGwdMDM+/bs
         OUrORC4iceHdQYBq+l7Rb2tubi+q7Nav91AZI05qQuBClf7sC71Dedqa76xA8j2sT7BE
         6lKAwvYW8LfQ74VqW0ftLpogc8XpxOVcpa1rX4neGLKGFUWZhIXGqKLqaWnKTcBrFqo3
         a2BtQ5R350fd2Khtgfgjw1KflsEzxxyXypX+wndCfbjjIDrcpxq+Z3G5bje0Mjt7712+
         l963HKn+3b4UaSn1EPG+R9VMblMIWPTetzzzOWmFMeMZmhb+JFEFMtXXQ7k2QWTz77sV
         iP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        fh=DPbqjFHnSnGngpEO4rloLb+7ewZKpS02VGDwPQtDUMo=;
        b=TOM+O0w1OB9AiTs6iw1S9tRRc4ttOCV1nZt87X4SwQrSYouPkwuWsthEcajqjqAAc5
         eoYjmUWSBownT0P945wuzc0kEwQsr+B0Zxv60NqejvnCjcypKAYKyMLkT0w0WXVbobfE
         q6sSnqKGGwRILXmecb+wli610FH0niC7Ol3JxdsxLtv8NM9urw+q/NjR2g/5cByYI5u6
         arFEdgpUo78UQ3Z9PHPXTxYf0jAC5nShweSeM5nJQjiaqX38yN8WZsSBo/snKFAHMGmn
         zCObkKF/+X/TrfEEbmbiyTFuacILFaD3JXW5/t2OJxTflwOTWEuDepMhXFVI1LiveHl2
         F6Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gfxstrand-net.20251104.gappssmtp.com; s=20251104; t=1792424626; x=1793029426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=I5zMYMFjy1p5CX18X0aBj7x8S85V3V69gQYG7/b39u+IKGe4NL7REZtX4AiEZBM4qq
         JLPRLVfw8S0RwtSxsDxnAwBq8GRN6zbA0cwg2niPSEFVPebhinjS3ai0Fkva/55PDmgF
         m5WZd76e5bZFOs8RvbQWdVba0p9VuUP/hUAZEv1rt/xpY/mMP/4YbezMK7o9KaDKGNO4
         tVw5g+J4wOgvS4ij79Lgb8NDzdYp4WPRI0povclW3o9XntlkD9+O8pjtTkTS9DLoI9Ww
         zCTRg4FVujYAJp/C7g+V83uCTL5C8JM/XQwCs2KnvtXrEdP+ldGYsTQO6ZcA3eQ4DREY
         2G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424626; x=1793029426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=cZciRXBv5gXSrvFrcpMj3V/fHrG0STpF/VdtKxGuzB6/PY2yrkHK1hdsTMfdKyTlu3
         20scYK2elMjD7wCNmy6WYlFSVEzNAIo1vMU8KCWZC6VUEiA5jq0+KFvcBow3+vNIzzbO
         J0oZHFdSMTvQoGgwfDNMhKA4455szQVJPWqcnSTtMrw3L18mR92pyIZSvKKJmICBJ+xt
         hw+L+0K80TyFAfD4a/f9ceKjR8ProAS2LA26lBlchb1HYOzOTAKpMWoGpk6qKvoRQScY
         x/ys87yMT26Nf6eETPY5I28FI2SUhJC59u7EiZCD++V33Pnh85L98TfDm9bAndcnpwSa
         JbVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxejvpvkOSlJRo+04wZOsZkflJAYy1ngv3XKIFYzrxAJcf1upn0NKyulI21B2paSwhAYYrgEuc4tg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6yQ6bHiWKoEtaR4bso5QkgAD2t4KIreoFNKl/ohuDbkLehMS6
	xNdBM/mtqm4+KMtUqhGm0Cuuve+yM3nhzNqLHX8n8UqzWZGbjb8GU6Gq23a6tkqJO9xLEWr+/AW
	rjLSStxpX0VxbHM+B2tGDFLz9gme4TmJCF24cLKX6oA==
X-Gm-Gg: AYBFou3iCTPZiVIWKvDtkkGT/0dq3FFrp4zj/OmW3hxJg/VuKUuJJkyAzWHhrOp2mES
	C6mXQIo6/qnZuIVDopdakdrxKc07nS0PWjMHXmAc6Y3O4uA8XRSj23hRvW1Gr9qBgPObLo5EMhH
	7ozze8FrV13Ceu42uwupvLS+iD/NXNSgSqTbrczL+jyJSXAO20mg3BhFrp7L000G137NAfGjqfn
	dPnWJ9/28IOtkqxa7oaJk5NowaVFam6sOEe0DBQF83RxUP38yNYXdrEMb3abkJuIOrqG21jcOaa
	CLgUBV0nuNfYPaipk6Uot3K7vsu+tTX9mXnPdMhowkp39CK85bWt
X-Received: by 2002:a05:701b:21cd:b0:14c:be8e:69f2 with SMTP id
 a92af1059eb24-18512b3f773mr11411490c88.21.1792424625673; Mon, 19 Oct 2026
 08:43:45 -0700 (PDT)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-9-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-9-apopple@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 19 Oct 2026 11:43:34 -0400
X-Gm-Features: AclHuK8wgzDeroqopGem9K3ppSyG5cc3vLnnGQN2wHpX-RdNKKojDR1u5BsOoW0
Message-ID: <CAOFGe97oDdZP-XDhthZ-5tuJjuJyKxvLq9YqvWaTApZE6B8exQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] drm: nova: Add usable VRAM size to GPU info
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 2:46=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Add a field to the GPU info structure containing the total usable
> framebuffer size. The usable framebuffer excludes GSP carveouts and
> other protected regions, so it may differ from the BAR size and total
> physical VRAM.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes since v5:
>
>  - Expose the GSP static info through a NovaCoreApi::gsp_static_info()
>    accessor and read the VRAM size from it rather than adding a
>    forwarding method, as suggested by Danilo
>
> Changes since v3:
>
>  - Partially new for v4 - previously a separate scalar GETPARAM
>    parameter
> ---
>  drivers/gpu/drm/nova/file.rs          |  2 ++
>  drivers/gpu/nova-core/api.rs          |  6 ++++++
>  drivers/gpu/nova-core/gpu.rs          |  6 ++----
>  drivers/gpu/nova-core/gsp/commands.rs | 10 +++++++++-
>  include/uapi/drm/nova_drm.h           |  6 ++++++
>  5 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 4a65bec0fbce..d0ab3df6bcd2 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -38,10 +38,12 @@ impl GpuInfo {
>      /// another documented default instead.
>      fn new(reg_data: &DrmRegData<'_>) -> Result<Self> {
>          let spec =3D reg_data.api.with(|api| api.get_ref().spec());
> +        let gsp_static_info =3D reg_data.api.with(|api| api.get_ref().gs=
p_static_info());
>
>          let info =3D uapi::drm_nova_info_gpu {
>              architecture: spec.chipset.arch() as u32,
>              chipid: spec.chipset as u32,
> +            vram_size: gsp_static_info.vram_size(),
>          };
>          Ok(Self(info))
>      }
> diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
> index 876451dcc051..64f9ea442278 100644
> --- a/drivers/gpu/nova-core/api.rs
> +++ b/drivers/gpu/nova-core/api.rs
> @@ -15,6 +15,7 @@
>  pub use crate::gpu::Spec;
>
>  use crate::gpu::Gpu;
> +use crate::gsp::commands::GetGspStaticInfoReply;
>
>  /// API handle for the auxiliary bus child drivers to interact with nova=
-core.
>  pub struct NovaCoreApi<'bound> {
> @@ -28,6 +29,11 @@ pub fn of(adev: &auxiliary::Device<Bound>) -> Result<N=
ovaCoreApiHandle<'_>> {
>          NovaCoreApiHandle::of(adev)
>      }
>
> +    /// Returns the GPU [`GetGspStaticInfoReply`].
> +    pub fn gsp_static_info(&self) -> &GetGspStaticInfoReply {
> +        &self.gpu.gsp_static_info
> +    }
> +
>      /// Returns the GPU [`Spec`].
>      pub fn spec(&self) -> &Spec {
>          &self.gpu.spec
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 91db64dcaea7..b9fba3a79b1e 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -301,7 +301,7 @@ struct GspResources<'gpu> {
>  pub(crate) struct Gpu<'gpu> {
>      pub(crate) spec: Spec,
>      /// Static GPU information as provided by the GSP.
> -    gsp_static_info: GetGspStaticInfoReply,
> +    pub(crate) gsp_static_info: GetGspStaticInfoReply,
>      /// GSP and its resources.
>      #[pin]
>      gsp_resources: GspResources<'gpu>,
> @@ -422,9 +422,7 @@ pub(crate) fn new<'a>(
>                      dev_dbg!(
>                          dev,
>                          "Total usable VRAM: {} MiB\n",
> -                        info.usable_fb_regions.iter().fold(0u64, |res, r=
egion| res
> -                            .saturating_add(region.end - region.start))
> -                            / u64::SZ_1M
> +                        info.vram_size() / u64::SZ_1M
>                      );
>                  }
>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index ffc25fd8c47b..5c1f9d296198 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -212,7 +212,7 @@ fn init(&self) -> impl Init<Self::Command, Self::Init=
Error> {
>  }
>
>  /// The reply from the GSP to the [`GetGspStaticInfo`] command.
> -pub(crate) struct GetGspStaticInfoReply {
> +pub struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
>      /// Usable FB (VRAM) regions for driver memory allocation.
>      pub(crate) usable_fb_regions: KVec<Range<u64>>,
> @@ -261,6 +261,14 @@ pub(crate) fn gpu_name(&self) -> core::result::Resul=
t<&str, GpuNameError> {
>              .to_str()
>              .map_err(GpuNameError::InvalidUtf8)
>      }
> +
> +    /// Returns the total usable VRAM size in bytes, i.e. the summed len=
gths of all usable FB
> +    /// regions.
> +    pub fn vram_size(&self) -> u64 {
> +        self.usable_fb_regions.iter().fold(0, |size, region| {
> +            size.saturating_add(region.end - region.start)
> +        })
> +    }
>  }
>
>  pub(crate) use fw::commands::PowerStateLevel;
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index 26a5e7ca5425..946bd4bf8fbd 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -180,6 +180,12 @@ struct drm_nova_info_gpu {
>          * currently known chips.
>          */
>         __u32 chipid;
> +
> +       /**
> +        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> +        * regions.

Does this also exclude the compression tag carve-out?

> +        */
> +       __u64 vram_size;
>  };
>
>  #define DRM_NOVA_GETPARAM              0x00
> --
> 2.54.0
>
