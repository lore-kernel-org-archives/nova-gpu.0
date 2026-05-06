Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90623E8C47
	for <nova-gpu@lists.linux.dev>; Wed,  6 May 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071353; cv=none; b=SUBdVsJbljSivso+B6vfPAUzwv5SMyrJznCgMm3qOzUOdeMdfMRo6Kv8dP3eK+A0nbYc3nk+1rBmZoCJUHY+iXDL+8pSKuCgEXnloRuG3EmwOV05nMxfl+Y0KsGvLKCdNdArQnZe7851TR6p+GwLdg43pKxvd5RBGDq6VgjkLnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071353; c=relaxed/simple;
	bh=FWXRoarZwbuPU0CvSG62/+ZjpGP5KpwDFvefCjFI/Sw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mWt1LXxg5pjpablNwX1LqPw2nxbqqzsTCgNjZ2K7e3I/Qm8R1FfBXvDlYIij27CwbbZ1vHjI6HkLbqGDUE2d8brZRwfWLlEWaEZ4ZgUfM9c55q11Up2SyVfVoU+1uYPhifuHrCON3xWkxEx6DQz9JsDN2GjLlbx8HKh0q+0HcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWk6xWga; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWk6xWga"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48a5952c635so69483375e9.2
        for <nova-gpu@lists.linux.dev>; Wed, 06 May 2026 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778071349; x=1778676149; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgVBoDfFSnA8IrE1su9Kgw5EWmAPu4xV1AP/RXJBkOw=;
        b=fWk6xWgapugekAD1nC5jryjAja5LyD1KplHPDYXnmZ+8TP+NV3NUuoTSn7nRXpKzfo
         Q8a5D49KczVBQz+Vz5KIlWGwMZbPquQ4w0x1NXJM8crbuXh8DBmYc9LssSog28jJEUxy
         nq0PDrPvUXWTP8LiBqf6QIo7MpdylNIaEQokCAk6Oa/fTNdZCXb14uQWbpzrGCbnJwVw
         SU0+lJeM1Ckooj1OGJ8h+r7yTVgrmKfAm0Dqn/lRGEYW2AVxqKVr++wlfWBg3ME33+99
         wdCSMherZc6luaJlwEECtgvNAbV41ssLo0zTbuKHkfcJUxCApezeSi4zEUvhyXdQDb4Z
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071349; x=1778676149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgVBoDfFSnA8IrE1su9Kgw5EWmAPu4xV1AP/RXJBkOw=;
        b=F+vQMxIwMFRpL38NZkfqjBTu0WEJhexOOGyFQv0ZckBX1tZqxg4Zali1zD17r/Y9nI
         7hKe4sbkZP7vEiLNZ9PhbVf3Mzl1021BydnLFyj1dYIBqRdZbDmyFNDBZzxCs1BfzSuM
         KPI53JTna21hJXlVVX0iauBuHvJ6KTaeGZnwjtUR6UDgJ1XDqjHhSKwXOvXKbpxeQMK0
         KYXjbFIrMKu/WgqcbNu7mpVi1mZ1cWVnOvfFF5cxk4/0aQXrWLLHCw540aeV74o1gZxE
         SyKAc6n0jBZkN2xglAiNvH3BEqB5IWYMg9/xNahBWQRqj96iKgKnuCmvKU+C6IC/Mqkm
         KFQw==
X-Forwarded-Encrypted: i=1; AFNElJ/vWP0hjoo6SZEM39GfOHFe30saPATSTX3LmtqsQNXjZksYevE1xYF1G12kFW8Nf2CvAz9hbtN/Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcBJUNUfgLdTrrKqErtlfb9YjpFTqf01hsAZFy9/JZR6kSMO29
	cH7FklJAvanQ1lmbDG7v4dIdEtD0us1tY2u7d/rI3ZTpeiChJlzu/EHQWiCcDtzwRyjgKBWd/J7
	kjAR6wNBNDcVARnaCBA==
X-Received: from wmbil16.prod.google.com ([2002:a05:600c:a590:b0:48a:73ac:6247])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a08b:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48e51f4119bmr57153895e9.21.1778071348766;
 Wed, 06 May 2026 05:42:28 -0700 (PDT)
Date: Wed, 6 May 2026 12:42:27 +0000
In-Reply-To: <20260505152400.3905096-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260505152400.3905096-1-dakr@kernel.org> <20260505152400.3905096-3-dakr@kernel.org>
Message-ID: <afs3Mz8J9oOeqF34@google.com>
Subject: Re: [PATCH v2 2/3] rust: auxiliary: add registration data to
 auxiliary devices
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

On Tue, May 05, 2026 at 05:23:08PM +0200, Danilo Krummrich wrote:
> Add a registration_data pointer to struct auxiliary_device, allowing the
> registering (parent) driver to attach private data to the device at
> registration time and retrieve it later when called back by the
> auxiliary (child) driver.
> 
> By tying the data to the device's registration, Rust drivers can bind
> the lifetime of device resources to it, since the auxiliary bus
> guarantees that the parent driver remains bound while the auxiliary
> device is bound.
> 
> On the Rust side, Registration<T> takes ownership of the data via
> ForeignOwnable. A TypeId is stored alongside the data for runtime type
> checking, making Device::registration_data<T>() a safe method.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

The change itself LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

But I'm not entirely convinced that this is the most convenient
user-interface. I'm wondering if the auxiliary driver trait could
specify which type the parent driver data is using in an associated
type, and whether you could eliminate the check and error path that way.
But then again, AuxiliaryDriver does not appear as a generic parameter
in auxiliary::Driver, so it might not work.

Alice
