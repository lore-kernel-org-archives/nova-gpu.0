Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F34DF4C2
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 23:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515891; cv=pass; b=C5JDCuM0RXIQ2TPl/hJlLxyhm7OTgCv6WTpQyv3CuIyyjz+SZrod7QFsKC8bADJJqK6OPUtgM80sQi3i7xcnp3ThmpfXV1dhK/FSlEs+tB8i3pG4JvR8hXLCTOwt7fb2CgjtJUO/cnmDtR4N5fa/zqn4SWyrVpSYFvmK1aYZako=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515891; c=relaxed/simple;
	bh=TqSdldQQLryc85OugYU8PhBQBy5+xKp2y2mlkv6Wji8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uESBHdS54u0EkxhmCRnok0NeQR3bt2pRSv/xLExWUlHIA7cC3yuRiGI6V8YGpm1zwkTMR9KK3P0oP4UfhfUrmDTuZ7131WiqjVjIl41opCe+Km05vciuRndr+TIBliModTkdm7rxv9I4AeuDlo0ryqNyeqoPPX1gZK6eQiadLvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5dS2uex; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5dS2uex"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so29617685a.2
        for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 16:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789515887; cv=none;
        d=google.com; s=arc-20260327;
        b=neQ5Jd16DsJdarJhVCpy1JkmSvvk58WYSC+iNsaCk/MGqLZSjHep/C2hD+DXF3bb5N
         KoOckHvANpU6VbEtCZKiOByPyjKkO9VgtKU0HCnx2rY9rIaxHlzlPRMklrOlIvqHHsPe
         9M3vdR/w0Z1T5m16drsVnBFwg30ANq/RIXYM13IHIzLB/UMqdc/x/uER3y+Z5yX/0a/V
         11WiJZY5tB5s/Ss3ojpNHxClo6ArgD9unVBWRjLGrW58CYQSNulIS5+cotrcB8HqJ0H0
         7qW6ccQNKDVI0M/+IsZ5p7IX424wZi2LPT6iMQvNi8JcOT3aiW+e8/UW8pZ7dTBKh5oy
         4L+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B6TfHIrWcaSjlSaK3gzPKAx2S0waXFIvqZ2/ZSYC1nc=;
        fh=OrcJ8B63An/TngEeKpYHBZESfiFR5K+MMkurb6cc+HQ=;
        b=XR9LdSD+0s734s70ZfRrYygiW6SQNGhQGnyUY/A8cUtb3fpf8NXSbWxbv07W89pUmQ
         o6gI4P9cEErCDwYVKgNPr9OcIdB7UntgZz71Xg/6AVaFhbbE3yHhRX6bo0PDDnlmVRsl
         o+bkZJ57ULVFzj+DTD497bgxCo0LQyWhc7DHsXqxNwalIWldNepV7KdnepzX/zusjfnm
         lp/tpsFwJthSqhJCtkrBFSVRdWWY1qKt4QksDzHx6HX8S4wUR4piL4hvLfg3re4uwQfW
         SHN3H7nStpSMnQZfyOmvIjLarZtbKM3nCqKCjyBwIKD9cPdmM8cO6a4rE6Kdvr1Zvez8
         U1xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789515887; x=1790120687; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6TfHIrWcaSjlSaK3gzPKAx2S0waXFIvqZ2/ZSYC1nc=;
        b=B5dS2uexhk6Vw3WegDHKzpqnsVZnOOpjgewBTZqNiXfS/OSaiuBl0p0vEei5N1fmYD
         hz2Z42qxvjdcM01Ii1YVVZb/20iZ9y9TjHiNk6tb8Hl1pWjFGY5TzYbJRBoFf1qDgbTT
         8gygXJa6uyDfYD7YAz5lyMDU7/KnFmJZy3aLAxQo0GXfZ6a4q7OVCfPpWRKKn/2NyHoQ
         miCT9GNKjxx6fECG2Wdyw2IvgeejWiWwQK04hXJJMlFOUG9wsV/VjaQoJyBSXdFco9xX
         dih11iICF1lz/Cm3l8AjnRIM0+UjZV8sek4W9BiNDIeycI7cXvgmztuIznw3VD3XM1+y
         YYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789515887; x=1790120687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B6TfHIrWcaSjlSaK3gzPKAx2S0waXFIvqZ2/ZSYC1nc=;
        b=fGMdFiwrnQoXcYHRRycVcVkOZ6J0RJ6XNipMe/bLKpsOHDKCVpsSRmjEldfVfzKJxO
         nG2u+N0y7b69k+8eu9C7lWEweV4KrjFUjlgnf7gtSIbE1rAWbn7HiKT868CBdets7b0i
         +cWxJaU8GFSrVqfyVoBeeBThPYsnVxP2wU5MXfFBJw5IckQRWXJKd2vuLXYi+7bb4e86
         ShcbB8QwMCdLoPtSDk8rsVgad5rmMsfOG7XxGZFJ2Aw7z3CaR3ZkTSnUdH30ijffbaAI
         epoKsuWmVTdMQ8arWy2hVe71ZJcrTrIc+s8NzYh9q4AyVFDgkdLaxPjKZFHSMNaSLy04
         6hnA==
X-Forwarded-Encrypted: i=1; AKwUvBxXWDZ0sZr0RltrP4UDU1P4wflMK7kuUeAXlL8XvU/XRiT3Wp4DkWhB84uonwrj3F7T36NqCOLdBg==@lists.linux.dev
X-Gm-Message-State: AFuF++m+vZQYs+ZAHSG0h1eDVZt/4rPpzH3cBu/k8OdL7IVlRrKEH/E/
	rNcMsdXjimqsraA3xO/zHPo1N7WGoYLUc0Lt+7q1my6/6rWVxJ/y3Sc/KatSw1JKRIV1POmqMvj
	EoW97n6xFRrAvrg5XS+5xcmEL5+FgXDc=
X-Gm-Gg: AYBFou1InMfv/zO1uUE7Lyr6AYHkCnJrVrsa6vnzfwu/yu4eayVHrrsc8eSDxhUNal6
	OhtifPeyMHudWZ2EFBdyoarGwDEotPaZVj6QBwAaIyTy62vDaNJD10P3y1dgND6ZXkeUzyge76w
	UH9TCeNVwQPvUmNWzzmoF+ecUKxg2F0hT+Vg1pj2sXQbyxXY/TEqVkcE37A2I/jKHehB3+DKAVs
	7+yMNmp/wxR6kvOUvIVwATLlo87YGNRwGxYHkhDt+mgZs+o5dvduvi+Uil3hDS14tOJCr6lQcM1
	EUL9KHZ0C5GDKApwyNlbjzrVqqv8amqDoX5U/79d1TH4UUBzHGioksJ+6Im9X0XA0/sxYzA9Tss
	u9GFxXJ3hlL+s8H8SRoI60R/NaqaCYxDNnLTgu0vvbA==
X-Received: by 2002:a05:620a:1714:b0:939:c71d:8d15 with SMTP id
 af79cd13be357-93bb77393c7mr73658085a.14.1789515887369; Tue, 15 Sep 2026
 16:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905081116.106613-1-zhiw@nvidia.com> <20260905081116.106613-13-zhiw@nvidia.com>
 <DLCRZLO06SIO.LS7TWQXIPZSQ@kernel.org> <20260914121217.70fa0d93@shazbot.org>
 <DLFD2ZDSK9YQ.3A4R66G8UJMD8@kernel.org> <20260915120148.7548a8ca@shazbot.org>
In-Reply-To: <20260915120148.7548a8ca@shazbot.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Sep 2026 09:44:35 +1000
X-Gm-Features: AcwNN1XzQ-BZPu-XH_LtSpgUCt0nAgXSDd_qK7yHBARKrtQdy7wMvT4f843zA9s
Message-ID: <CAPM=9tzwkNniadSABL-EfLn1hKyw3Am=seX7vJjJbXci_5vSUA@mail.gmail.com>
Subject: Re: [PATCH 12/13] vfio/nvidia-vgpu: add the NVIDIA vGPU VFIO variant driver
To: Alex Williamson <alex@shazbot.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
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

On Wed, 16 Sept 2026 at 04:01, Alex Williamson <alex@shazbot.org> wrote:
>
> On Mon, 14 Sep 2026 23:36:24 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
> > On Mon Sep 14, 2026 at 8:12 PM CEST, Alex Williamson wrote:
> > > Hi Danilo,
> > >
> > > On Fri, 11 Sep 2026 22:39:16 +0200
> > > "Danilo Krummrich" <dakr@kernel.org> wrote:
> > >
> > >> Hi Alex, Jason, Zhi,
> > >>
> > >> On Sat Sep 5, 2026 at 10:11 AM CEST, Zhi Wang wrote:
> > >> > NVIDIA vGPU VFs require their open, reset, and close lifecycle to be
> > >> > coordinated with the PF-side nova-core driver.
> > >>
> > >> [...]
> > >>
> > >> >  drivers/vfio/pci/nvidia-vgpu/main.c   | 253 ++++++++++++++++++++++++++
> > >>
> > >> This is going to be a longer response; sorry about this in advance.
> > >>
> > >> Looking at the FFI boundary introduced in the previous patch, I'm concerned that
> > >> it translates the driver model relationships we've expressed through Rust's
> > >> ownership and lifetime model back into raw pointers and lifetime assumptions
> > >> that callers must uphold. It also introduces manual lifecycle management across
> > >> the boundary, rather than preserving nova-core's RAII-based ownership model.
> > >>
> > >> I think implementing the NVIDIA vGPU driver in Rust would let us preserve those
> > >> relationships across the interface, make lifecycle management less error-prone,
> > >> and fit naturally alongside nova-core and nova-drm.
> > > [snip]
> > >>
> > >> If you've made it this far, thanks for reading through this long write-up. I
> > >> hope you find it useful. Please let me know if you have any questions or
> > >> thoughts.
> > >
> > > I can't really say I made it this far with comprehension, but thanks
> > > for the effort ;)
> > >
> > > The one piece here that I can actually review is [5], where
> > > dev_get_drvdata() is replaced with a vfio-pci-core struct pointer
> > > embedded in the struct pci_dev, which is a non-starter as far as having
> > > a common PCI-core shared by various drivers.
> >
> > Well, that was just a quick hack to get it out of the way. :)
> >
> > I think there are a couple of options.
> >
> >   (1) Make the PM helpers take a struct vfio_pci_core_device * in the first
> >       place and let the driver forward to the helpers in its own PM callbacks.
> >
> >   (2) Provide an (optional?) driver callback that translates a struct pci_dev to
> >       struct vfio_pci_core_device.
> >
> >   (3) Provide a macro for drivers to define PM ops, letting drivers provide the
> >       function that translates struct pci_dev to struct vfio_pci_core_device.
> >
> >   (4) Give struct vfio_pci_core_device its own PM domain (which is probably a
> >       bit overkill :).
> >
> > I understand that the idea is to hide the PM handling in the vfio-pci framwork,
> > but I think the existing implementation is a bit of a layering violation, since
> > class device implementations shouldn't impose requirements on the bus device
> > private data layout.
> >
> > I also think that the approach to fully hide it in the framework is only really
> > worth if it doesn't otherwise impose subtle requirements on the driver (such as
> > the layout requirement of the bus device private data).
> >
> > Thus, I'd personally just go with (1) as it is the most honest approach in terms
> > of driver layering. But I think (2) is a good alternative that is not more
> > invasive than asking drivers to set the bus device private data to
> > struct vfio_pci_core_device *.
>
> I'd position this more as a library convention than a class layering
> violation.  vfio-pci was originally one driver, vfio-pci-core was
> pulled out to enable device specific support, ex. migration, in a more
> manageable way.  struct vfio_pci_core_device is not strictly a class,
> it's the object used by the library that variant drivers opt to use
> rather than re-implementing vfio-pci from the ground up.

Not to be critical of an evolved design, vfio-pci-core should probably
be structured as a series of helpers that drivers can use, rather than
a midlayer. Midlayers plagued us in drm, let drivers drive and provide
the VGA/PM interfaces using standard vfio-pci-core methods rather than
forcing vfio-pci-core to own the pci device data.

Just because C let's us take shortcuts with struct layouts and
pointers, it doesn't mean it's a clean pattern we want to continue
with indefinitely. You can look at the rust use of the subsystem as a
chance to clean up some of the corners where layers aren't clean.

I just threw opencode at the refactor and for $12 of my massive budget
it produced

the prompt was:
"in linux/drivers/vfio/pci the vfio pci core decides that drivers must
install a vfio_pci_core_device struct to drvdata, this feels like a
layering violation, I'd like the vfio pci core to be a set of helpers
the drivers use instead of midlayering itself, can you plan that out
and then execute"

 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c | 54
++++++++++++++++++++++++++++++++++++++----------------
 drivers/vfio/pci/ism/main.c                    | 45
++++++++++++++++++++++++++++++++++++---------
 drivers/vfio/pci/mlx5/main.c                   | 39
++++++++++++++++++++++++++++++++-------
 drivers/vfio/pci/nvgrace-gpu/main.c            | 45
+++++++++++++++++++++++++++++++++++----------
 drivers/vfio/pci/pds/pci_drv.c                 | 34
+++++++++++++++++++++++++++++++---
 drivers/vfio/pci/pds/vfio_dev.c                |  5 +----
 drivers/vfio/pci/qat/main.c                    | 38
++++++++++++++++++++++++++++++++------
 drivers/vfio/pci/vfio_pci.c                    | 34
++++++++++++++++++++++++++++++++--
 drivers/vfio/pci/vfio_pci_core.c               | 66
+++++++++++++++++++++++-------------------------------------------
 drivers/vfio/pci/virtio/main.c                 | 34
+++++++++++++++++++++++++++++++---
 drivers/vfio/pci/xe/main.c                     | 34
+++++++++++++++++++++++++++++++---
 11 files changed, 322 insertions(+), 106 deletions(-)

It seems to be correct code, and makes things look more like drivers
owning the outer structs. I did look for this pattern elsewhere in the
kernel and it's not common at all, in fact my quick search couldn't
spot any other instances which again suggests it's not a pattern we
should be leaning into.

As for the rust stuff, I think for vfio your drivers are just not that
much of a horror show or refactoring often enough that rust will be
anything but a blip on your radar, having Zhi/Danilo and access to any
sort of LLM will generally make most refactors trivial, lots of
maintainers keep bringing up the same concerns about refactors and
interfaces and breakage, but I'm not seeing the problems, and most of
the refactors that are rust driven are make the C code clearer.

Dave.


>
> > > Can a Rust vfio-pci variant driver be self-contained, or to what extent does
> > > it impose on the framework, such as the drvdata idiom.
> >
> > As mentioned above, I think this one is more of a layering violation in the
> > vfio-pci-core; class devices shouldn't impose layout requirements on bus device
> > private data.
> >
> > The reason C drivers can get away with it more easily is e.g. that C relies on
> > procedural cleanup and that all responsibility for managing lifetimes sits on
> > the drivers themselves, so it is easier for them to adjust. But in general, it
> > wouldn't work out if all class device registrations or other core primitives
> > would have the same expectation.
> >
> > For Rust specifically it is that the driver core controls the lifetime of the
> > bus device private data, which is a fundamental requirement to e.g. represent
> > registrations as RAII types. E.g. the vfio::pci::Registration has to be stored
> > in the bus device private data, such that it is guaranteed to be correctly
> > destroyed on driver unbind.
>
> I see, so driver core has its own convention for how Rust drivers must
> use drvdata.
>
> > To get back to your question, a Rust vfio-pci variant driver should be
> > self-contained. The interface sits in the abstraction that translates the C
> > driver API to a Rust driver API. It sometimes can help quite significantly (e.g.
> > in terms of how complex the Rust code needs to get in order to actually be safe)
> > if the C code does a minor adjustment, but it shouldn't be necessary.
>
> It's not clear to me to what extent these abstractions hinder our
> ability to evolve and refactor the C code.  It may not "lock in" the
> core API for variant drivers, but it seems it raises the bar that any
> significant code refactor likely needs to refactor the abstraction
> layer, potentially the Rust variant driver itself, which imposes a
> burden on the vfio community that has so far not introduced Rust into
> the code base.
>
> > For instance, the only addition to the driver core we have is an additional
> > callback in struct device_driver, and in the future an additional pointer in
> > struct device_private; none of those couldn't be worked around in some way
> > though.
> >
> > On the other hand there are examples where the Rust introduction motivated
> > design improvements on the C side, or bug fixes for issues that were caught
> > while writing a safe abstraction. For instance, we recently had some fixes
> > around dyn IDs in the PCI and USB core, which both were motivated by Rust code.
>
> I have no doubt that integration with a more structured language would
> lead to various improvements.  However, it doesn't seem there are
> resources to support it in the short term.
>
> > > FWIW, AI can only go so far to support reviews.  Having the code
> > > insight to ask the right questions is essential.  A human in the loop
> > > is a requirement.
> > >
> > > Additionally, if we can't narrow the device matching to only the
> > > Nova-core supported VFs,
> >
> > Agreed, and I think that should be possible. Is there a particular case you
> > think of where this wouldn't hold?
>
> The modalias scheme only matches on vendor/device ID, subsystem IDs,
> base/sub class, and interface.  Nothing in the PCI spec requires that
> the VF device ID is different from the PF device ID.  Variant drivers
> will often present a larger match surface to avoid the ongoing
> maintenance overhead of listing explicit device IDs.  Such an approach
> here would put us in the position I noted in the previous reply where
> the Rust variant driver needs to fully support these devices via
> vfio-pci-core on day one.  Binding GPU PFs to vfio-pci is a current,
> valid use case (VFs for some vendors as well).  Thanks,
>
> Alex
