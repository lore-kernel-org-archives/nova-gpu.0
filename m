Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280393A9DB3
	for <nova-gpu@lists.linux.dev>; Tue, 28 Apr 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360447; cv=pass; b=JFgYUZPCiPOWGT37AhmSNclm9EP17qBxlAjbmglOcVjRWnU6r5o7HGyHqiZHYlh0c6VoNMOhU5atY0dkI7H89DWf+G1ORkXBEoSCYHJVzICYF6erNViDjH7jmxg8ZvPiKk3sCkNAFfM0zD2V9YL0Z5SyaTFTUbuYElXz6nPMQ2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360447; c=relaxed/simple;
	bh=wXO914DzlCvt1xCzISvIcZB3spoiCMyWasvLAd0ea50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SA4DVTnZpzpyta6GpPlvczB1sAlWXhYkx0MVphyIGV0OgooNkan6BVFXsFQAqWpCvp7LJ4zQrKJpRhKVaRVueEMw/gOyyGJkwP/PwAnG7gsGY2cjmmtWLjoDlxjNZuN0GPUxy2ujqGNOpLs4QPWGy39mdvXv+ovQWdmv+Cx7mro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goNp18UY; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goNp18UY"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8a016799d2cso121642666d6.1
        for <nova-gpu@lists.linux.dev>; Tue, 28 Apr 2026 00:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777360445; cv=none;
        d=google.com; s=arc-20240605;
        b=ODicKdqTp9I9omSPOHPKsGjuER2QEfacEhyZpOtnsKsgIz+Jd72paWkziYZmNI/3pt
         M++MJ1H+TNfbERLTkTpGXl6I6CZwsq8u3CpWyDVyI6m3bju0bf2jOEpy8watmz0V427X
         FirUr0d0Tqx1RP5lfSRITFE6EEj6VlwEyoINiUvbEvLh1aUrj1mWYEEMRxWeCc59d+RK
         uxrcr0q7IdzlwfdJFisDQXG/0Flm0QSbR0syu6liDBqWwu3dr3YL65zvaDQMlixUX/1f
         e/16K62aAavy+VKCxfDKcMyuGyxB/qgquKMVdhzDiuJRQdTY25g+r/+fEYOETojIE5wW
         cVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        fh=Z/iquZ23T4L8NyFKXlLn5LeZ8+ecUCdgmj1QnwoOz1Y=;
        b=TuzXDXD/PoIVJLJor2S819tsyc9XW42h8Nr/Gk682f8klRuagDzvftk8scXZ0ZarsG
         iiWo+5ORLpdVLuB+ru2jo2kAlcBQeJZACR4LxCOjbz6V3J+WkXJw3ZNC10hPto7vrFyn
         +xKqWJr015LpLAV6Z0ozYRYbVFQTpmHeYijYnq3Uy+4L+hOrNtNm4KULHIrnKysKmWBc
         Pfr2sSRyn3lXnaSUKy8VLZqYPqcGsbIFAuA8axiDa7s8YoQM0rWJHc/C8njmlKi3qgg0
         2gaiidkxyK+YpoV7PjIJdtaKLybozq0kjTg8PXDV84XP7XBU41LG8ShH0055XgJ1BvO+
         7/bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777360445; x=1777965245; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        b=goNp18UYO2hARS9b7EbwNiDM0Rq3lSrDno+i9KYMOs0cD/jfgqlmztU3h/qZxA8F0U
         k1Vfagu/4llvvM53qdQjFq/3ptW7HnOo6c/6S9dcuEoXTC75ybc25nUN5RyALSjtM/ks
         dWQ80BvOs+9i7Jyyxs87m/wpNxLR3/Q/YpKF0/ZgBzs1HCO29Phew1a4/gxQznIUUQf9
         thjr7g5ejhq6CD2Og7RVPhZkgOMpI5H+x0AgzX12AUocS4Whhtxwz7Lk6hmkargjMQtH
         MIQVBRXQcDqjprtCOlIfGIEUQvdGUgjjpOkKjXapmtlIND5nCkUxHPc1NMRaAaRriKIL
         rvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360445; x=1777965245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W/BRRXVZrOrIYfHk58kcoL0ZIugS6jzrDp2fpxbXyE=;
        b=LmhvXejVATX5QL6t/oaqUz7dySxOyf+z5RaH4m95Ab1tOr0S9BbXFM9/SDtkGHBd8V
         Dd1ymPvbCzwvVf3xavtS5vtEIg4uyXxjFyvq5iSu98GcYzN/AF5ICRNJj1y2rNHUdQJq
         q6s02TIUT3EHf0ar4WujbNkKQnoLya/sDD9EZIza+mCHkJc/depWvOoe1Xljpty3ym5f
         DzUXqJT/CNZqadsiqskhM3KsOfwOxTmuhWmIMHVn4CYztZ89IxcvAWQlpWYFPl8z+8US
         d+tHak8pJLRry+cjdq6Gla90NBUs+NbEpHzpvW3wty+JsGpbIgkv+qAEzbBBJOtNJfFN
         3jww==
X-Forwarded-Encrypted: i=1; AFNElJ+iI532Ryig8GmPCD6zkWWXGWfIQdWKhe8KLj/nQN3Nycieil/yuD3aOtxzH4Hk26BH1na+nyzvmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKtBxTjI2XrMbQ92GbsBUeFp4YCSYIqL82fVdnl5LVIXBCccP2
	sAhm3/GYLMiKsiFqPBTM8uQy03CBvGu5vX+RK9R6JmfFzszWjzmWPXS9N/xT1one9gqyFh1g+6V
	TPg3MjTtzmtF7E7Sm5YQqrG8l1ueKD/Y=
X-Gm-Gg: AeBDiet0gbcDucIL04TKOQUw9vhBeDbf5c/+YXejP9fdYf4MsFlxCBTlZBpoc8iXy2K
	r4zy++SWrSNNnaKjW2enH5o6o0sKyWB3UN1sNx7rudIFU1hAyMneXA61gRGBa7hbnGMZcN/1K61
	sWLm6hD0uvP92CKbatEPMrYwD4hUjQ6LCPdUPsp4YWolTZtxg9QFQNSSyZ+MofHLRe/U2VDhGyk
	OTvv8UZM9BZszeFMYlksDph7ZWKY7KariblkkXwe36Xhk46bOwZmiG3rb/poS6fRlKSB0KyFlw7
	Eg9pCo4p9tFoLTcq1AfxwXx/mUQiQEpd4pMw6EtfE1UjtlS9v+XLQjNk+mBkDru9oabN2r50emx
	ypGd94SrqeYJO
X-Received: by 2002:a05:6214:c85:b0:8ac:7e8d:859b with SMTP id
 6a1803df08f44-8b3e3042234mr33557846d6.16.1777360444839; Tue, 28 Apr 2026
 00:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260427-nova-unload-v4-0-e145ccddae66@nvidia.com> <20260427-nova-unload-v4-6-e145ccddae66@nvidia.com>
In-Reply-To: <20260427-nova-unload-v4-6-e145ccddae66@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 28 Apr 2026 17:13:53 +1000
X-Gm-Features: AVHnY4JXyz-pKFTieaHSl_cn50HfzH5pJCH8mAkupYMsNUdKe3qRNzjTlM-mr8Q
Message-ID: <CAPM=9tx_QJf1VNh7TDMFuaWoaZqAhte5ybADef7vfroeB5HSew@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] gpu: nova-core: gsp: shuffle boot code a bit to
 keep chipset-specific parts close
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 16:57, Alexandre Courbot <acourbot@nvidia.com> wrote:
>
> Some parts of the GSP boot process are chip-specific actions, whereas
> others (like sending the initial post-boot messages) deal directly with
> the working GSP.
>
> Reorganize the boot code a bit so the chipset-specific parts are clumped
> together, which will make their extraction into a HAL easier.
>
> This has no effect on the GSP boot process.

So this is something that has changed in open-gpu over firmwares.

Older firmwares pre-595 always queued up the async messages before
hitting the boot sequence,

on 595 and later you send the async message later in the boot process
once GSP is booted.

I can't read enough context in this patch to know if that matters, but
I just thought I'd point it out.

Dave.

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index e75c4b235aab..2e1401cd6171 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -187,18 +187,13 @@ pub(crate) fn boot(
>          let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
>
> +        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
> +
>          // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
>          if !fb_layout.frts.is_empty() {
>              Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
>          }
>
> -        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
> -
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> -
>          gsp_falcon.reset(bar)?;
>          let libos_handle = self.libos.dma_handle();
>          let (mbox0, mbox1) = gsp_falcon.boot(
> @@ -227,6 +222,11 @@ pub(crate) fn boot(
>
>          dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
>
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
> +        self.cmdq
> +            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> +
>          // Create and run the GSP sequencer.
>          let seq_params = GspSequencerParams {
>              bootloader_app_version: gsp_fw.bootloader.app_version,
>
> --
> 2.54.0
>
