Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99BB308F26
	for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329937; cv=none; b=Okjr6j30a1bFi0k4qNJUFZUXpWmmroNqma3JNTH+nAosl9O3tiR5ogTo16T2VsW3KlhkNgbobiRntZz+0QMQ3lWl7b2w+MptW7gjkwVzXppQFGwPaWimHd/9TWEIHf2IP6X67u4e2LxjuFzBGuBSU7BsBXnACGU10M+Y/v3xDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329937; c=relaxed/simple;
	bh=/i3F8aVlRB09Jw0j8WKE0aoMUU83ZBv8ZxgBmJ4bEUk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIg7cm22RNZXR7cZYFx40oZbHiiePqUWj/URuk5Q0+k5h8LhP+JoGZ806UYIjDcYfyzjEKQaqHZnJZ1dx1O0PCUvXWK+L2AdXwqEUMA6ARV52mzaSzH3gqivbNBmIBJ/lIp9fZ8/UM+12FFLJuxBV7ZT0di/r/k8Ie2ByZWvk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOn6K9hE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOn6K9hE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso9379075e9.3
        for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329934; x=1782934734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JvYdpn4YzE4MVNRAOjv5r8auqSp+Gt6NQ8Tln1OeLY=;
        b=pOn6K9hEzCYKmHSbBQQd7KYz+PBfGzV2lS5qfgkVaz733Hu2w1GsR6tWhUE+6Vk+B2
         uhqdwQzQKuXm9OTZlrqoyg/c5nTQ/7rnNRQ8eRSMqoTpSoL0kenO0X+kafVIqX2ejkqM
         sBTpsr87aidQXbMirVKLmRnVEiKqRFYYovC4eFbo32I0bGsrWkqjlOPcA7j6yb9amknO
         Xx/BRwADPSYXwigEEpRoyURg/rBMA6l1sW/XHJ8Fks1C/m+M603QlFgoFg3ks5ViY3ZU
         b6VA8rQ+aUEvg1PwzpLyLvSnTODYITrzp+kYWb9K5pMO4D+8PzEZqCXbV8X9bhFUq7mX
         9Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329934; x=1782934734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JvYdpn4YzE4MVNRAOjv5r8auqSp+Gt6NQ8Tln1OeLY=;
        b=N9GNdgb1LkMUnMlwSvj2XSlhNvNXLTwQa6fq2rK4X5ANqzvtatoZTcQBR8peA+2mh9
         17ZwTbc7EhvJww3u3c1dUvojqc+lqJDCZkDRnfFYcvUoEqx3ImyCHWdX+DlxgMZKgcYv
         vn/ONzMHI+iCSOWUqNzJUoLC1mSVbSpvP+WI3HAgEtGjMTpS47Ur60pjWczfd/QgwmZc
         ZRKrd/CbF15cssDdNwyZ0JbjZVl4suD/FX+a2+kgYH/1EzYpWXVvGEnrkBF2Oxyo5HY4
         VXSyhy/Thi2yR9kESouiyYgGb1XVFAIyh1M7YCU56aIqLGiXdQUDwy9saLuPq7np97QM
         e7+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8nYl1S+6yJ1AVO0IvBGF9A3WOBF/xM8lp79MEdL7+0OaL8HS/CihgJEoeivGa8SWebixifaXy81Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBd5cNIZ01NcOjYhAckNMgndmhxrFcqmpSKb6e3UVQf4Jaud9n
	JBUZPiptBgdmCY/DfZXLUM6bDm7gXoRmgzf33TMcmaSdZKkVmsr6a6H0
X-Gm-Gg: AfdE7cnVpKbhG94MgdHZijet1Fe7ZNixlTctWfm9KBeUK09LvEKNKQmJDCaoFURIrAk
	xk9ue0j72I5gkqcoTUdM5HNfdZG/NXdhEGy09zEuQgE1HCrKRMtPwcrkdXaRFgEJ8ESO6YbxJqr
	OVnEYL5whbTDB0ZAp8Ya4EivPS0UNpOIyW+KXxS0VCyg1UX3LO/ihjljXbCVja9jJ6mgP2zFeFg
	S6YOhaXk8cfUKHXkCBtnljjU2h5eA6UklRRgatuwrXehVNQpeF7XEIiveTkK/9LkHBJvx1OPbZD
	248G5gA8eQ5RgL1b2Qs25d8eBBoky3vLsxJFZl48M4688TabCl0MPV7T9Lctt7g2CyegFt1KJJ9
	pyqyAObd89519m9Agf/u03OffMcjP2IcMUzeToHM+6kNVM/AUC+dSQ4+/KsuvvJQKl9Uw/cm65D
	39+vZ3j9hNn9qv8RqOM6BXpFwVDT/baebkzP/mM0+DkF9rJSLaqQ==
X-Received: by 2002:a05:600c:4ecb:b0:492:433a:53af with SMTP id 5b1f17b1804b1-49260858030mr72253305e9.16.1782329934022;
        Wed, 24 Jun 2026 12:38:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926494f129sm5853685e9.0.2026.06.24.12.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:38:53 -0700 (PDT)
Date: Wed, 24 Jun 2026 20:38:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
 <joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] PCI/IOV: Return u16 from
 pci_sriov_get_totalvfs()
Message-ID: <20260624203851.7f6c7be4@pumpkin>
In-Reply-To: <DJHDAQZ1AASK.14ATT70HTI450@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
	<20260622194353.1308872-2-zhiw@nvidia.com>
	<DJHAC9W05615.19MHKPF67OG2T@nvidia.com>
	<20260624143937.50499c29@pumpkin>
	<DJHDAQZ1AASK.14ATT70HTI450@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 23:59:56 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Wed Jun 24, 2026 at 10:39 PM JST, David Laight wrote:
> > On Wed, 24 Jun 2026 21:40:52 +0900
> > "Alexandre Courbot" <acourbot@nvidia.com> wrote:
> >  
> >> On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:  
> >> > pci_sriov_get_totalvfs() reports a VF count, not an errno-style
> >> > status. It returns 0 when SR-IOV is unavailable or the device is not a
> >> > PF, and otherwise returns the PF's driver_max_VFs value.
> >> >
> >> > driver_max_VFs is stored as a u16 in struct pci_sriov. It is derived
> >> > from the SR-IOV TotalVFs field or from a driver-provided limit, so the
> >> > implementation cannot return a negative value.
> >> >
> >> > Change the declaration, CONFIG_PCI_IOV stub, and implementation to
> >> > return u16. Update callers to store the result in u16 variables, remove
> >> > obsolete negative-value checks, and use unsigned format specifiers where
> >> > needed.
> >> >
> >> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> >> > Cc: linux-pci@vger.kernel.org
> >> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>    
> >> 
> >> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> >> Link: https://lore.kernel.org/all/DETDILPA1GFY.27WND0TEC5352@nvidia.com/
> >>   
> >> > ---
> >> >  drivers/crypto/hisilicon/qm.c                   | 8 +++++---
> >> >  drivers/crypto/intel/qat/qat_common/adf_sriov.c | 6 +++---
> >> >  drivers/gpu/drm/xe/xe_sriov_pf.c                | 6 ++----
> >> >  drivers/misc/genwqe/card_base.c                 | 6 ++----
> >> >  drivers/net/ethernet/cavium/thunder/nic_main.c  | 2 +-
> >> >  drivers/net/ethernet/emulex/benet/be_main.c     | 3 ++-
> >> >  drivers/net/ethernet/mellanox/mlx5/core/sriov.c | 3 ++-
> >> >  drivers/net/ethernet/sfc/ef10_sriov.c           | 2 +-    
> >> 
> >> I believe that you can avoid converting all these drivers in this patch.
> >> The implicit `u16 -> int` conversion done by C should result in the
> >> expected behavior, and it will be fewer Acked-by to collect.  
> >
> > The generated code is also likely to be slightly better if the function
> > return value is a 32bit value.
> >
> > Similarly you don't really want to do any kind of maths on local variables
> > that aren't 32bit (or 64bit on 64bit builds).
> >
> > The fact that the domain of a value fits in 16 bits doesn't mean that
> > it is better to use u16 - it is usually worse.
> > Pretty much the only place u16 should be used is to reduce the size
> > of structures.
> >
> > So it is probably correct to change the return type to unsigned int and
> > remove the error return checks, but nothing else.  
> 
> For C, I agree that unsigned int is the safest type.
> 
> Rust otoh does not do implicit integer promotion, and making it return a
> `u16` carries useful range information. I wonder if we could have a
> private `__pci_sriov_get_totalvfs` that returns a `u16`, make
> `pci_sriov_get_totalvfs` promote it to an `unsigned int` and return it,
> while the Rust bindings would invoke `__pci_sriov_get_totalvfs` so they
> can expose a `u16`?

That is getting silly, something will end up doing the masking to police
the 16bit value - it isn't just the C rules, the ABI pass/return u16 in
in 32bit registers (even on x86) so one side (or both) has to mask the
value.

Your rust code has the same problem. Add 1 to a u16 variable and code has
to be added to mask the result to 16 bits.
You won't see it on x86 because it has 16bit alu operations, about the
only other cpu eoth them is m68k (I'm not sure about s390 - it is based
on a very old instructions set).

	David
