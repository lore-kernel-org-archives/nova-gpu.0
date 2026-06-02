Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD327F19F;
	Tue,  2 Jun 2026 03:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371645; cv=none; b=ixRU7yMQs1aeFgYeixCFuZSWkfAkwEiwdzfHczzmcSmWWIBB60X/Hu3dVERpivCFQUU7stOWBWlUGlvr1UEFGIly/58ZYUOvJPL/AC7mVo9EAwaO+O0C8lTGqnMyv+SSH5ecw5CBXgVtsGXb0txz1TOupSwppxFuj4HuCNYQfc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371645; c=relaxed/simple;
	bh=VHpY6EDJeBPJ0Oe42CiyifYkc4rnSiAIZHFbZ6ndDm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HXZtsJZw1byttLkNXbii1GiQlPV7bdcNrx4MdVdms3b7Jt0Le+OkLdShzM6OZY6Y1aOh9c2SZwTCu+0fibiGzgF5QADdjYz64EGblcgRNkTawp9ENjKLANOZs2zgvdZNQepL5HLdAdMpKziLxauj7RiJZg5XvKYezAbEZIuDuqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhpY0UE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhpY0UE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C26E1F00893;
	Tue,  2 Jun 2026 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371643;
	bh=jDqy3hY7qEHGCSDZKHfWfnE5WZdJMYTvOX0U+vI6uXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhpY0UE3PvxxAo0NRuOGrTc9bHWNvXvqOtMYa7bkgFVEtZ6NitJG1c/CJuMBooypP
	 0bAWUXS5bo/aEh6U/+4CI1hEhyBOJc8EBgGBESbKeP4ZArhfDN+qsiirpW1MbgVMpL
	 XVZyOPfu5fVOfpGllzKVDcH0v6V1YO03OpCv2UJu2HxnntQYEI0voWykK9qb97JsbB
	 Y0EgIaO/nxngFpLtj854LJ+c842D8UrDcxf0PIElLxeUohef6Mne8lq7GAHKPz4rj0
	 E1w+lsNTOGDVptA+kPBhtlLH2ZO9cmuVNtIXus056wmJz+KgOD8EvOv+DFGbPvCJSz
	 ulWmCMYiLzIZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 19/22] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Gary Guo" <gary@garyguo.net>, "David
 Airlie" <airlied@gmail.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alistair
 Popple" <apopple@nvidia.com>, nova-gpu@lists.linux.dev, "Shashank Sharma" <shashanks@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>
In-Reply-To: <20260602032111.224790-20-jhubbard@nvidia.com>
References: <20260602032111.224790-20-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:40:42 +0000
Message-Id: <20260602034042.7C26E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] DMA Use-After-Free of FMC boot parameters during initialization
- [High] Missing little-endian conversions in hardware payloads breaks big-=
endian hosts
- [Medium] Kernel stack overflow risk due to large struct passed by value
--

commit 42c5f0e39c2bb0bc87a3f8df25554d04f00a3e69
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
   =20
Build and send the Chain of Trust message to FSP, bundling the
DMA-coherent boot parameters that FSP reads at boot time.

> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 67cf83aba83c6..352ef7683cf2a 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs

[ ... ]

> @@ -113,8 +190,65 @@ pub(crate) fn wait_secure_boot(
>          Ok(Fsp { falcon, fsp_fw })
>      }
> =20
> +    /// Boots GSP FMC via FSP Chain of Trust.
> +    ///
> +    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], =
sends it
> +    /// to FSP, and waits for the response.
> +    pub(crate) fn boot_fmc(
> +        &mut self,
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        fb_layout: &FbLayout,
> +        args: &FmcBootArgs,
> +    ) -> Result {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipse=
t);
> +
> +        let fmc_addr =3D self.fsp_fw.fmc_image.dma_handle();
> +        let fmc_boot_params_addr =3D args.fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !args.resume {
> +            let frts_reserved_size =3D fb_layout.heap.len() + u64::from(=
fb_layout.pmu_reserved_size);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<SZ_2M>())
> +                .ok_or(EINVAL)?
> +        } else {
> +            0
> +        };
> +        let frts_size: u32 =3D if !args.resume {
> +            fb_layout.frts.len().try_into()?
> +        } else {
> +            0
> +        };
> +
> +        let msg =3D KBox::new(
> +            FspMessage {
> +                mctp_header: MctpHeader::single_packet(),
> +                nvdm_header: NvdmHeader::new(NvdmType::Cot),
> +                cot: NvdmPayloadCot {
[Severity: Medium]
Is it intentional to construct this ~868-byte FspMessage structure on the
stack before boxing it?=20

This also dereferences and copies the 816-byte FmcSignatures structure
(sigs: *self.fsp_fw.fmc_sigs). Doesn't this bypass the optimization in
FspFirmware::extract_fmc_signatures() which avoided building FmcSignatures =
on
the stack?

Could this contribute to kernel stack overflows? Might it be safer to
initialize it directly on the heap using KBox::init() or KBox::new_uninit()?

> +                    version: hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?=
.cot_version(),
> +                    size: u16::try_from(core::mem::size_of::<NvdmPayload=
Cot>())
> +                        .map_err(|_| EINVAL)?,
> +                    gsp_fmc_sysmem_offset: fmc_addr,
> +                    frts_sysmem_offset: 0,
> +                    frts_sysmem_size: 0,
> +                    frts_vidmem_offset: frts_offset,
> +                    frts_vidmem_size: frts_size,
[Severity: High]
Will these native integer types be correctly interpreted by the little-endi=
an
RISC-V FSP/GSP processors if the host architecture is big-endian?

Because the struct is laid out in big-endian byte order on big-endian hosts,
won't the little-endian hardware swap the bytes when reading, resulting in
incorrect sizes, versions, and DMA addresses?=20

Should explicit little-endian types or byte-swapping (like .to_le()) be used
here to avoid breaking driver initialization on big-endian hosts?

> +                    sigs: *self.fsp_fw.fmc_sigs,
> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        self.send_sync_fsp(dev, bar, &*msg)?;
> +
> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
> +        Ok(())
> +    }

[ ... ]

> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 0c54e8bf4bb3a..558b37863f00a 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -934,3 +934,67 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
>          })
>      }
>  }
> +
> +#[repr(u32)]
> +pub(crate) enum GspDmaTarget {
> +    #[expect(dead_code)]
> +    LocalFb =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
> +    CoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_=
SYSTEM,
> +    NoncoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOH=
ERENT_SYSTEM,
> +}
> +
> +type GspAcrBootGspRmParams =3D bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
> +
> +impl GspAcrBootGspRmParams {
> +    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
> +        #[allow(non_snake_case)]
> +        let params =3D init!(Self {
> +            target: target as u32,
> +            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMet=
a>() }>(),
> +            gspRmDescOffset: wpr_meta_addr,
> +            bIsGspRmBoot: 1,
[Severity: High]
Similarly to NvdmPayloadCot above, will these native integer types be
correctly interpreted by little-endian hardware on big-endian hosts?

Does this struct require explicit little-endian types or byte-swapping to
avoid accessing invalid physical memory on big-endian architectures?

> +            wprCarveoutOffset: 0,
> +            wprCarveoutSize: 0,
> +            __bindgen_padding_0: Default::default(),
> +        });
> +
> +        params
> +    }
> +}

[ ... ]

> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index b25970dd4561d..f41f3fea15ff2 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs

[ ... ]

> @@ -39,17 +42,27 @@ impl GspHal for Gh100 {
>      /// the GSP boot internally - no manual GSP reset/boot is needed.
>      fn boot<'a>(
>          &self,
> -        _gsp: &'a Gsp,
> +        gsp: &'a Gsp,
>          dev: &'a device::Device<device::Bound>,
>          bar: &'a Bar0,
>          chipset: Chipset,
> -        _fb_layout: &FbLayout,
> -        _wpr_meta: &Coherent<GspFwWprMeta>,
> +        fb_layout: &FbLayout,
> +        wpr_meta: &Coherent<GspFwWprMeta>,
>          _gsp_falcon: &'a Falcon<GspEngine>,
>          _sec2_falcon: &'a Falcon<Sec2>,
>      ) -> Result<BootUnloadGuard<'a>> {
>          let fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
> -        let _fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
> +        let mut fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)=
?;
> +
> +        let args =3D FmcBootArgs::new(
> +            dev,
> +            chipset,
> +            wpr_meta.dma_handle(),
> +            gsp.libos.dma_handle(),
> +            false,
> +        )?;
> +
> +        fsp.boot_fmc(dev, bar, fb_layout, &args)?;
> =20
>          Err(ENOTSUPP)
[Severity: High]
Does returning an error here immediately drop the args variable, thereby
freeing its DMA-coherent memory before the FSP finishes reading it?

Since the FSP is actively booting asynchronously, wouldn't this cause a
hardware use-after-free of the boot parameters, leading to IOMMU faults or
undefined behavior?

Note: I see this is fixed in a later commit 'gpu: nova-core: gsp: enable FSP
boot path' which changes the return to Ok(unload_guard) and properly handles
the required hardware delays.

>      }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D19
