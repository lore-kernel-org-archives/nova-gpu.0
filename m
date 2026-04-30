Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C539A04A
	for <nova-gpu@lists.linux.dev>; Thu, 30 Apr 2026 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539626; cv=none; b=d5omJ4Pu8R2GCiVwpGV8NxIZE+dPsU0MT/dzxZckUs7X8zEV0nUp94Nhs6P+Yfg7N6oAAmNytmC+Cddl2gpzNbomhvRAbBKSzdF4l1NkTAgqaTlamCrejG4T5Q4c/j8BSiubzBUKeMdM0elhKon7f/Cb6wmYJEWOSs3Ub1ctAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539626; c=relaxed/simple;
	bh=CV/9r9T1tGl8H3sNgsRyAGGKdcCvUg4t94aJpNXl2Jw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=guxwxMU3jeUD9iTcSqi6AVOABaiKDpSw4LYZ9vcn/0MFaIQhuIGgOJFfDAawXuu8K4pgLOCC0tmXF219dh7jZw+nOD8Hm/Dpx2kRFgNuBTTFW4LfZo5rLYGq3aNmFd9Utwqo+80TeN5aLmqdLNETtQ6extyNIkq39OnAxqXfxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i3cfr3H3; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i3cfr3H3"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d1dea12aaso587560f8f.1
        for <nova-gpu@lists.linux.dev>; Thu, 30 Apr 2026 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777539621; x=1778144421; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=i3cfr3H3Ysox/10Kz8X2KVcxScgezX1yckhM04YeNKTPOzbMyYkJiXSLcy4z01mVhm
         twoHC4SeDrARgkHZCi6/S0KfyCzHnXyUwm7WFijH/U8vaJ5DY+9jz+5cIpj/gLroGOaP
         wg6kuBhd9ITZGZ98Era4r9XpmDqsoad/MRHNlJbFwPGrJ6i2+hDGtEp6BKCKt56Q+K+Z
         +AhDoJDlPb+nRh3JTnj8EmCHRhhHQQOrF0AoOCwVr4XQEGVEgmXwfAvbnOffBVbN4HjR
         PggBb2/48R6s22i1Z8L1ubwW9kHyHiRNuYcfnY90L1VJyrq9/STtLjOxMERtv+eochxs
         ebQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539621; x=1778144421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBhPKhd+Br9ZjEmkXcxZU210pei7kYegjOF/K5Z2t0=;
        b=ZbAUBCYYkvkstq5ZuR0AdcSB5HySY0MCr+ezpYLTLQUTPX6uvWgxH6uxBeOtuZHhtS
         Sr0x40aJp6gwZPPxoMPG2jzIaWEF7bOacyxi+pzixqz3QBDg0UktzLac7rpCHpRNj+Fz
         FGhTajIvMIHapyJiXKCcRVhldLl64R0Vud7v/8XvtrvLKtVpVpwHGvXAWDEQOdLwuziG
         APQu0CRLUqDQTgHuo/J8VrQz5P1uQlVV7f5tQR1JFcPYIinD6U60Ckuw6pnGasi/dkBZ
         3tOuJQDRCkMuniCFh2uoMkQU8ABqC9S4D/kHPFtf6s//S0rnNNLBj3Xx6QtfQ9ZPk+fq
         dJuw==
X-Forwarded-Encrypted: i=1; AFNElJ++OMy1aadkvrKtposPgAjJNWcSIyWrpRTBIU3bstKwcxlcXalKVnSlFYXwdevvGY/n0jWsEBACdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvkYR1gA70C6O2gyCDGZ1F6xOmKHAWmSklF21hyty4cfHiuyMj
	snbRgHAjLniqg+A8NErhjXfx9BMA1EGsoXcuaxB4T7333oQDSFpiQRGh8f05vWfju0Rk4f7F68f
	FOBDyhxzkk4fQfnLTew==
X-Received: from wrwv10.prod.google.com ([2002:a5d:6b0a:0:b0:43d:74ca:3105])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1869:b0:439:b8b2:fabc with SMTP id ffacd0b85a97d-4493e1c1512mr3145148f8f.21.1777539620636;
 Thu, 30 Apr 2026 02:00:20 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:00:19 +0000
In-Reply-To: <20260427221002.2143861-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221002.2143861-1-dakr@kernel.org> <20260427221002.2143861-3-dakr@kernel.org>
Message-ID: <afMaIz-EUsHbzqAc@google.com>
Subject: Re: [PATCH 2/2] rust: driver core: remove drvdata() and driver_type
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 12:09:41AM +0200, Danilo Krummrich wrote:
> When drvdata() was introduced in commit 6f61a2637abe ("rust: device:
> introduce Device::drvdata()"), its commit message already noted that a
> direct accessor to the driver's bus device private data is not commonly
> required -- bus callbacks provide access through &self, and other entry
> points (IRQs, workqueues, IOCTLs, etc.) carry their own private data.
> 
> The sole motivation for drvdata() was inter-driver interaction -- an
> auxiliary driver deriving the parent's bus device private data from the
> parent device.
> 
> However, drvdata() exposes the driver's bus device private data beyond
> the driver's own scope. This creates ordering constraints; for instance
> drvdata may not be set yet when the first caller of drvdata() can
> appear. It also forces the driver's bus device private data to outlive
> all registrations that access it, which causes unnecessary
> complications.
> 
> Private data should be private to the entity that issues it, i.e. bus
> device private data belongs to bus callbacks, class device private data
> to class callbacks, IRQ private data to the IRQ handler, etc.
> 
> With registration-private data now available through the auxiliary bus,
> there is no remaining user of drvdata(), thus remove it.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
