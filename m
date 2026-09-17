Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6D36AB46
	for <nova-gpu@lists.linux.dev>; Thu, 17 Sep 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609784; cv=pass; b=X+7bKdz4Lwpc6gLPGihTRC5VZfwjTe5zHJr5F9Jton+XBESsNp3LvyLn1SkPFE/SxJUnUQOidbUeaq/yAN+xXRF6L8bR0Q0JO47N9VuYeoGYYdvoBIJTMz+w2lsBfJ/PAK6fYlm5Y5UUq1dTXlFS/bCAa671jtk8XA6MbavruQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609784; c=relaxed/simple;
	bh=4vvuCAg8LOYwCkFNxLubS5odZ0quKkv2reSoFIokHEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxhGW8RZJZhNxRNZzxONH5acBmKXpx4Ye3+wSNhZpJDd4qCHai5XR0lgs65xxgreKUeq51Fe76VUwT5vd0i8gaW93ShG5YSs5kiEdbqb6XrkqiYsNFO6h0T4vCVzNUnHVgsaj3glZhMlri8BFuGdpyy8XLEa6StxEqRkmHRQf/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2IuMtGC; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2IuMtGC"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76906adso3041061cf.0
        for <nova-gpu@lists.linux.dev>; Wed, 16 Sep 2026 18:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789609781; cv=none;
        d=google.com; s=arc-20260327;
        b=cd+TCdO+RzwgrGQ4X5PFFTrdyRJldLPm0a6PG9RUqPrTPbcKgkV0nJ3OavLcHhZ+jR
         Izl2CeSxLUxFySPSSfn8bszQ1WYpTcad6i13GloReqQoLMVjSsZXH0+973Z3IIpBFyOs
         IOWECHvCAu0suIPtTSncAjkVZzQDpvq5M03qHDaWQCxwwRT8pUQ7zT1PH6d4Sv0qGW/B
         inoVGeLdke1ea3hPIE3bLa6zUQGG5vpzE2leEH0N7hk1iX6uYvnfbvloX2sUqEjZ7UY3
         EWlxd8lpiRvez5OmBLFXw48rGnUaGosUq2EKN30KJhZS+NywLa4/+o8QoLLX4vPWSg0/
         bYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        fh=HsimXxMBpIZN8RHqdVey0X9PSIpH3sWgPWajMjKxHVs=;
        b=SVQa5xhwFDqw1uZRcM6E07Xldu/OgDJbtx1dcS+syf5TXYLmjH+gFPAgkslnQArTlA
         FijtUhQTAMKDxMEWNkbv8tMSENOjwmalGn7PajrQgR7qwQtEoOQezyVTIkKbAGtYItrP
         vQDOSHz/WINK3uvy8Nj9Vm9bR8NqyZmPc5t9zpx49TacylgMI9ktXyAVMoqdDEC90+mG
         s6VcVtcM3lTFhllpO7UpLsFo+cnn2a7Oc0xYxZXwDAcO8KsK5uCDEz780acLSo9dioMu
         SHuIv95Jlek/M7gGnIyhtS2EKhHcwccuOth1CnSYp/9q/V2h+lIns3pE2QjKzp+f0B1j
         AbnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609781; x=1790214581; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        b=G2IuMtGCjsF73Fn2g66KTHmuD140Gq0kgXLH+BIea2mCFjs4nbpEoYTdW3eYkyHzeL
         cO4OBrOxFbZQuWAqctB7cSXu/Ai90uiNhw3pqlVoviuuutHS52PuKsV/gcqfaEtWRZes
         MnDm+DU0o6fisyuW78qG4quXpmDRM9S1/gltYn6eESxk2AkQyE/JeryL8maWmf25JY5A
         dStU2uImf4EbOrSbBbV7I+HQsLE4PzTcBIpo2cpzrY457se6uUmrQfhPViKy9XZrsF2j
         UP6r1co/LuqO7nYvZl162tG4lcLMRa2/wf+3d8lITKQaXvFVNLAJpsT4XWTiby++hTu/
         lETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609781; x=1790214581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ijmEvQZ7YCTIw8TR2oOyYMWmdXBKTEydSXSQjwrQ2VM=;
        b=wKHHbU5jw8BNxgjd6JIntKx4jNErIEnJJ2HLImgY7F7HMKyuaQbV3LwWHKyzcjgozN
         lgk7dL6JUdDdOkKQ4NXKqxIebYyZtOvrdB+WqFupp8qXfymZ5QTHTT8M82Zv+fZB4yjC
         bPlrBvz8gWvErnKwtrBwxIb2fgwFaliW6fg0bYlB5k9WlE9zRRsIkUH2T+N2Y9mlLymk
         wRsMXJHGVl7/QdFzXFoc3D3krlGONRIUiRl17aJGGsAOqVpxi85prEBZ15jG20z2Znwp
         O2E6bH3FiYi0+NXFTIRpji438awVWn9tvQpAql6qxafEaHFEXpP4B9gqJNlqIkFPSkvH
         MN6A==
X-Forwarded-Encrypted: i=1; AKwUvBzMxcAQSx8z40pEzejinabEJUKOxjZATUVc4x8PCa+s7rJZYoEynPJygEU8sy1NAJNp3h6lUDJGzg==@lists.linux.dev
X-Gm-Message-State: AFuF++meXmW/K7LdMxdvJzvd+a2MK8+A4iF2UxOD50u4Dbw9robEJUe5
	ivpGbVgPOSsM8jFVBDsQj/SIwYsxPONssuyVfGfBSaaj5bvVMefgYCm6tbHZivpx+JM+5obsZ3G
	MSHcMMAJygWc0kCVUFfRHWW3s82HWl0U=
X-Gm-Gg: AYBFou2DQbaP5OJ+d+yhwrE9hJTJ8E3VEMdodYCIRdnXqp/QrKCTDBuVkIkqCMR+ACF
	bcbcUMHpnu7lCYadPn2818/kv2s04mNgh6Mlq++u9+cGZ4sLjWsOP7997tQ+B6T+tEM/57XpfkA
	W87/YncQj3jgiAXGreF3TAkT9mZAGL0JxN7+FqImxTNbgIATjIvU7Kfw/Hf6GjHaDh372MrMRf8
	ggsX2QtvYKh+6MH6JThNBDbOi26252C5Tu6Litx+2yG4/NafQ7Ql56U/JimaL2Ra8KDmj96zEkn
	NVxei8qH94zxCayGORmVtxWzumTR7EWy4nGpSX89xfz+6YFw0NhJajhgcJMauUX6EYVs+IInxsa
	nuNglg5bcEQuu0NZ/fE+fBTOk9ssQf7oxi6lIkGQ6
X-Received: by 2002:a05:620a:6292:b0:939:78ab:3c5f with SMTP id
 af79cd13be357-93bb76e2fe8mr878910085a.9.1789609781431; Wed, 16 Sep 2026
 18:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905081116.106613-1-zhiw@nvidia.com> <20260905081116.106613-13-zhiw@nvidia.com>
 <DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org> <20260914121217.70fa0d93@shazbot.org>
 <DLFD2ZDSK9YQ.3A4R66G8UJMD8@kernel.org> <20260915120148.7548a8ca@shazbot.org>
 <DLG7C7MLGSTC.2GSTD84WI595N@kernel.org> <20260916141718.GU3968357@nvidia.com>
 <DLGUPX9KPFKF.12CU304YAST79@kernel.org> <20260916162817.GW3968357@nvidia.com>
In-Reply-To: <20260916162817.GW3968357@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 17 Sep 2026 11:49:29 +1000
X-Gm-Features: AcwNN1VXCeIhnNkZrtRydjWaxN4Qnt0jH2kObUrck50VuTkYeDZzVilcahg7zlk
Message-ID: <CAPM=9twda0Q9nj9E5AUCi4=en5tDA7ReBv8MV2Ftg-STwNbDLQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant driver
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>, 
	acourbot@nvidia.com, yishaih@nvidia.com, skolothumtho@nvidia.com, 
	kevin.tian@intel.com, simona@ffwll.ch, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, jhubbard@nvidia.com, 
	ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, nova-gpu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, zhiwang@kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 02:28, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Sep 16, 2026 at 05:38:21PM +0200, Danilo Krummrich wrote:
> > Usually, class device implementations can't make assumptions of the underlying
> > bus, because they have to work for any bus. I.e. there's no other way than
> > providing helpers and letting drivers do the glue code between the bus and the
> > class device.
>
> You should think of VFIO as a series of helper libraries. One of those
> libraries is "here are all the PCI PM ops you need".
>
> Drivers rarely need to customize these ops, they just need to wire it
> up to the support library to avoid a bunch of code duplication.

It's currently a library being used as a midlayer. demidlayering it so
drivers control drvdata removes that.

I sent the diffstat that covers all the current vfio pci drivers and
that didn't seem excessive.

>
> Stated another way - the very point of vfio-pci is to remove
> duplicated code from the drivers.
>
> So if we wanted to push hard on removing drvdata, and don't want to
> touch the struct device I would probably say to #define up a way for
> the driver to build its unique trampolines. It wastes a bunch of .text
> but at least it doesn't duplicate code.

+static pci_ers_result_t hisi_acc_vfio_pci_aer_err_detected(
+       struct pci_dev *pdev, pci_channel_state_t state)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = hisi_acc_drvdata(pdev);
+
+       return vfio_pci_core_aer_err_detected(&hisi_acc_vdev->core_device,
state);
+}
+
+static int hisi_acc_vfio_pci_runtime_suspend(struct device *dev)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = dev_get_drvdata(dev);
+
+       return vfio_pci_core_runtime_suspend(&hisi_acc_vdev->core_device);
+}
+
+static int hisi_acc_vfio_pci_runtime_resume(struct device *dev)
+{
+       struct hisi_acc_vf_core_device *hisi_acc_vdev = dev_get_drvdata(dev);
+
+       return vfio_pci_core_runtime_resume(&hisi_acc_vdev->core_device);
+}
+
+static const struct dev_pm_ops hisi_acc_vfio_pci_pm_ops = {
+       SET_RUNTIME_PM_OPS(hisi_acc_vfio_pci_runtime_suspend,
+                          hisi_acc_vfio_pci_runtime_resume, NULL)
+};

is how much code it adds to current drivers, this doesn't seem
excessive for 10 drivers,
like you could obfuscate it a bit with some macros, but I really don't
see a lot of value in hiding
what is effectively just standard driver boilerplate.

Dave.
