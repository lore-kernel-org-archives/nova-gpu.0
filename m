Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123AE38B7D6
	for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308382; cv=none; b=GlOgSvF0qXvC5cXyIQhB5yBWzbZRFuGMZDuDjFTl1STCVd8aoTxwKMtIkok6H/VakjPNmyzrOZWEPDvQbvwLpzqj7K0LtZCGy0OwHOY4fSJxZ6etM58Q2aFIofo/jP1U/xAgiInrK8Eh9sAetX+IFCwfy62mpzLgmk3bZyzS194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308382; c=relaxed/simple;
	bh=bCN9QXSeKcThALlWIblZF+dwzG/gKPOqYW26oOCeuYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHiLH5FwJa8XwUfCZxc3mL2/vkYoLyA8SgwFTqsEDE+te9hqfPbnB18FriFOUa+9pKFxW6Tbt5j+YMBtNpnviC0DzXoN/uUs/JN58OpITS9uh0kQbvnCC3q+eTX2WI07/QuhdX+3pl3jokShUCMyqiNAqNCwiFapQbT0qOyRK/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek+vMAHA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek+vMAHA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so10825935e9.1
        for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 06:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782308379; x=1782913179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwEU/3SC+a/Dow+usckYBKgjXhWK/UqDUFsUC31pETA=;
        b=Ek+vMAHAUtAZIxJ5ch0Ucu4/+W/LSPsty15wVzFH5lLc8rwHd8uT5Iy1QGRG1N0eLx
         6UP9fZ3xPdQFsV6YjTz3BqLwcmBy+qki/ov39reVe8aHl2WBhrNDAt2ORZd/NR9ubwkq
         0AHAXvUZSEMgwrWOG1/kg3fdtLeHBtw16YK0Ygu+/aRap5FL+iL4ENevVS0/TCx9iXRl
         oOx/JZymM32ZM7gpsIIEpZlz+m6cs3bMgOfFS17pLWqjRiWknyC6FzdlxCfEQzdws1Sv
         3muDqdr7tSMLnj/Mv+GHiBxvigpcSz+ydJSfmLukJpUfqgL58tYCfXSK8wfXU5bY9DAk
         3cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308379; x=1782913179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwEU/3SC+a/Dow+usckYBKgjXhWK/UqDUFsUC31pETA=;
        b=orY1F0+6BoWqH6CY402W8zgIfrHJo3AnzG5D3urp9guA1Mwf0VpZ2XMsQasYtGhuf3
         xLQBTDnJZUAfKhgSkLjTpaDs4H8jgb7tEFkJlTtyD/dBboArxXG03TJQYTgiIDUtWSVb
         FbDBqFsVThSaVgFR2S3rOUH+t4LZdZuItdI1wQxOM5j/zkN5q4NImKz9u0l7mzT9B8B2
         ksZ0LX+MVrrL6f/heI57IElxDCnQl71AXQQ00RSx0Tih4Hobgb5txgJ1aPk7j57si4tq
         2bpL17ow0pmcHtSNa7vhNGcChpmHjIaZ7UCE33Xu9A3XPcAvB+2IU38W84NajuVEUANp
         DAPA==
X-Forwarded-Encrypted: i=1; AFNElJ9skaNffcHap5BFj3Nmao9l+rb8stSZjR2jQjyHpvtajJ+u0/pJmRlTPb6ah5OAnWqXySGALAPt3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8DBbj8U5QZbA3aATb/nmh0IaVC00wumwcS/RvNTFUQz2MWLnT
	vE1D6hKr+fnjyLz1knM6Pm37qMkJNjT23vXznDsnl/PWkMkmxt36oTpM
X-Gm-Gg: AfdE7ck0gYmdIB+o1hY6Yoeh8hwFkXA7iHuxpt0PqPSK4aqvfO5WOINMTzc22LCuSgt
	bQtNn1CDl5LnDMplzYdQyDxuuK6BPkC4TlHL0yt56xUGC70CwDMfQwzpa+yUicmM9JGbSdXGfS9
	AVuhz0Y+dAYEOG7eq+b97ZwL11+FuuDkXk0x8SgtczS2DomH2OVlxs3FSf8u+kBXKE9InoS6yC5
	vUZPqsAWjOo3Qkps1DPVFc+LBeDjdHlY6SMZOjKUvWN7hGZKgc7WsoXJ2njWkWYDSqIrXn6ttYj
	P//IG8o48lHcUP9mep84yLlOBq8BoSE9/wF8dvZVoTAUtTmQ1qCyBVnu8M/TR+m4tMaiVQbnbhn
	d57q2stl142bh5ki/snbFCQyGRGJ7S7RH8Nou7Nk1NjTWv4g7FscU/mzA/hYOO4qYh0IX3kBYQg
	L653/Idt0A0a4YGmyfdIc25CkdwYSybxAsnjss+d2OSab8UrvyNrNDETlHHw3x
X-Received: by 2002:a05:600c:8b77:b0:492:4911:8a with SMTP id 5b1f17b1804b1-4925b35a0f9mr107690435e9.12.1782308379175;
        Wed, 24 Jun 2026 06:39:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm802880225e9.0.2026.06.24.06.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:39:38 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:39:37 +0100
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
Message-ID: <20260624143937.50499c29@pumpkin>
In-Reply-To: <DJHAC9W05615.19MHKPF67OG2T@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
	<20260622194353.1308872-2-zhiw@nvidia.com>
	<DJHAC9W05615.19MHKPF67OG2T@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jun 2026 21:40:52 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:
> > pci_sriov_get_totalvfs() reports a VF count, not an errno-style
> > status. It returns 0 when SR-IOV is unavailable or the device is not a
> > PF, and otherwise returns the PF's driver_max_VFs value.
> >
> > driver_max_VFs is stored as a u16 in struct pci_sriov. It is derived
> > from the SR-IOV TotalVFs field or from a driver-provided limit, so the
> > implementation cannot return a negative value.
> >
> > Change the declaration, CONFIG_PCI_IOV stub, and implementation to
> > return u16. Update callers to store the result in u16 variables, remove
> > obsolete negative-value checks, and use unsigned format specifiers where
> > needed.
> >
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: linux-pci@vger.kernel.org
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>  
> 
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/all/DETDILPA1GFY.27WND0TEC5352@nvidia.com/
> 
> > ---
> >  drivers/crypto/hisilicon/qm.c                   | 8 +++++---
> >  drivers/crypto/intel/qat/qat_common/adf_sriov.c | 6 +++---
> >  drivers/gpu/drm/xe/xe_sriov_pf.c                | 6 ++----
> >  drivers/misc/genwqe/card_base.c                 | 6 ++----
> >  drivers/net/ethernet/cavium/thunder/nic_main.c  | 2 +-
> >  drivers/net/ethernet/emulex/benet/be_main.c     | 3 ++-
> >  drivers/net/ethernet/mellanox/mlx5/core/sriov.c | 3 ++-
> >  drivers/net/ethernet/sfc/ef10_sriov.c           | 2 +-  
> 
> I believe that you can avoid converting all these drivers in this patch.
> The implicit `u16 -> int` conversion done by C should result in the
> expected behavior, and it will be fewer Acked-by to collect.

The generated code is also likely to be slightly better if the function
return value is a 32bit value.

Similarly you don't really want to do any kind of maths on local variables
that aren't 32bit (or 64bit on 64bit builds).

The fact that the domain of a value fits in 16 bits doesn't mean that
it is better to use u16 - it is usually worse.
Pretty much the only place u16 should be used is to reduce the size
of structures.

So it is probably correct to change the return type to unsigned int and
remove the error return checks, but nothing else.

	David

> 
> I.e. just updating drivers/pci/iov.c and include/linux/pci.h should be
> sufficient as the first step. Specific drivers can then be updated using
> separate patches that will be easier to merge individually, if you want
> to do so.
> 

