Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD50388393
	for <nova-gpu@lists.linux.dev>; Thu, 30 Apr 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540482; cv=none; b=TXvoMxHpR2IOj6Hdu1nGzAZAfefkRZmG1YbIDZ/6obG1GmNcAjOfCXkpYukXoZnAg6dATBW9ePIxpnGOG8WkzAkyf65DEnYvnAOranAS3SeRA5IyKPUgc976WSTHLwlqa7QUPSLwQyB/iXZYg4ZMY1qkp3hDsdgYQl6RdMiF5I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540482; c=relaxed/simple;
	bh=sVifEoF/oe2xdwrFV3e2F++qf+hnysQw0CLe/H5O8ts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CgI33NTnV2GGEq4Lsb81n/YS9RLTo+eioDTL2tdcArhCxkbO2p8XZhYUkB5LT8DtmLH9t+Kg4LX1D03SWY7jol83x8Q/Ec1/qQM432wSBzZtYFrPr3XaMLOQ0VdBGwtDqXP9BN1EBnX926+Z5bj4cr2zXYthWPo10dMec5eCxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ETuz25Gt; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ETuz25Gt"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ba47bfada67so64997566b.1
        for <nova-gpu@lists.linux.dev>; Thu, 30 Apr 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777540479; x=1778145279; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9iVxD0Q/b/KabKpN0s2yCS+iq2LiFZxDqstnJNGVdg=;
        b=ETuz25GtScBuI34kRbZdH+q5ycRbvYglNTmCnKn1RdCw4+CIVlu+cU8txrgzgMYfvn
         GFOVI+oFNoHn8hhpPFKS66BlrsjtqIZD2u9D+37g0tpdhbNMkUer8F2zzL6wBQpw76jO
         Dgap/FfxRdUjmBquK0QBMigSJ79z1t+uccxwo8wojv0j18i+APFq34wtycf5DCvHtskG
         e0GH/1SL7MI5k9QIT75NzHoK/MEI6hDnsxK5PfT8qWJ5fw4t/TLC2fYACy3FrlwYeKrM
         YeATtHAZ4gOkk89Vh7Nx/se5ldVc7OfVPyzY1C5uqAMN5REaYrqPd85E2CcylbvqV4k6
         yGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540479; x=1778145279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9iVxD0Q/b/KabKpN0s2yCS+iq2LiFZxDqstnJNGVdg=;
        b=bOTtHsqJ9aPCQOxVu2pQ61j+A08XxEWzpDRvJTagw8a92I2GmWoRbzfPS63eQ854e0
         llc7zxkqVrqd39PjzIkUkd7R4SKMoekclOCLy76IVxVrcRUVg5ZVOTXBIguiDxKW0mv/
         REH8JmGP7xsdTFQb9pmUW/DqgsbJhHrY5v/K+0KwMVgGD62mGcYLeyWl9yTCfnwLBiZy
         dkBvmWSFrXjz5qWgK+IBY5VwSpoYrd183czynICN8kGVb44CLu1VHMUo2FLmgKcXuxEk
         Dn+9j61BP4i07LK4voEgs9do0Qu6wg/2mmILDLgFTU/8oZCKSuEa7P2Ggq6WOZwsucnQ
         /QFw==
X-Forwarded-Encrypted: i=1; AFNElJ93agY/JpnMynyzdoGN91e+3cEoXGjKo1fo9jd2JZvDCEvhrkA36K2rCGfrrDsb3V1L1XEQSBqmJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR8hXrWPokXd722EzasuPszwTEEdxJspp7wHGq8R6/O7q7yh2u
	2smuVBSahNCI6YgVtEj/W+Sk/4DG3n+zv7fgBAlspXqAafIf1pmBX2abOh/9CU1Zvf9xs0/MK0Y
	T/Fj4ynt8HGTIeITw0g==
X-Received: from ejcqw42.prod.google.com ([2002:a17:906:6a2a:b0:ba5:8db:d6f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b98:b0:baa:2d37:cbf9 with SMTP id a640c23a62f3a-bbac5abfee4mr145636666b.1.1777540479322;
 Thu, 30 Apr 2026 02:14:39 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:14:38 +0000
In-Reply-To: <20260427221155.2144848-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221155.2144848-1-dakr@kernel.org>
Message-ID: <afMdfs0segrRBx34@google.com>
Subject: Re: [PATCH 00/24] rust: device: Higher-Ranked Lifetime Types for
 device drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Super cool to see this!

On Tue, Apr 28, 2026 at 12:10:58AM +0200, Danilo Krummrich wrote:
> Before:
> 
> 	struct MyDriver {
> 	    pdev: ARef<pci::Device>,
> 	    bar: Devres<pci::Bar<BAR_SIZE>>,
> 	}
> 
> 	let io = self.bar.access(dev)?;
> 	io.read32(OFFSET);
> 
> After:
> 
> 	struct MyDriver<'a> {
> 	    pdev: &'a pci::Device,
> 	    bar: pci::Bar<'a, BAR_SIZE>,
> 	}
> 
> 	self.bar.read32(OFFSET);

I think we should establish a convention for how to name the lifetime
early. Using just the generic name 'a is probably not ideal.

How about using 'dev for lifetimes that correspond to the lifetime of
the device being bound?

Alice
