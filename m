Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA817D6
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702724; cv=pass; b=CB1DMQSgp8m/19scIscITApS/Yywlhs+zzwSb640VXRuOZKdQyHc/2AkDyxt2P8ReXtbstFiZpwoLVMegTKmAMH37aedcD4jJgYJt3p8TI7ZqI7T1CrX5jMAaU607fnCA8OxQlYGgvaIB7B9daox4hMZ87NUTUyTJs3KsXzyaCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702724; c=relaxed/simple;
	bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDF/jTtnOjUc5j7O1RWRjjIYbBycHmodNdHTkmfPZbUcvX/X6w9rMxLgnTpHchJTcFT2NTdpjiYbRlVnH1qy08PQIfywotqpQmmx8akjmGLvkhXpqpAVbF6FLSQVH43GpEVOQNhB6cyx50unYHFe1b7aegxOKlah/pv89ihSNzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNX3vwHc; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNX3vwHc"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3e6b1so14833885a.0
        for <nova-gpu@lists.linux.dev>; Thu, 17 Sep 2026 20:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789702722; cv=none;
        d=google.com; s=arc-20260327;
        b=b22NbiMEnldeTKyn7lhUv+GX4en6OoCS2uEudusgapkbZxnlzI790mX4eykcliAtAO
         jR2H/YnpBqz+GE7BvXj+iXq7FPcB6ZxIO0OjdPlnS6GqiXjQtS+P2Q72c59JEPxMUiLD
         qe4/krQbnVwt2KOyzdXFHjr0DXQP/KIOuX9UKf21qA+TpVJEWJA30NSiiapSx5mQSETG
         fZ3qez7MZaABDX1J4dsmS2GvkVV+//jmWBgP6gwoxmmdAH5dsxflIM+WpqKSMoUI+yC1
         pi+d6SGmDPrsg9kRlJdwIrdwNHfIV1sBmKQbH9BliWTzJFbtQytXXRgckxPbFwQSWnUO
         0oYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        fh=S8dGfsjZB5DmLmRe8MPLPFiS/SyRZbXnMU5q4cbjYJ0=;
        b=XkyoOi71iWFqSATpQFMOK/xFn7HX1AAfr/5441VqLnSQyYEIbqDP4cg4OhwjkYBdRe
         LSOpc7NN1jSLgswxAlWCzL5jczFp98ms1ntKyDk6KKWwJ6PPhaAoTzUnsCmA/t33xcG9
         5Rpwzgu+gpeq3M4+layvj3+DFvgKICX492EvwB6oEYjgw0E4TQ6pNxpQucNzNvW4DeAa
         BxZA5bKmr7Wh83vrO76T2saBEwNQOOxvrOQRCyhMttQXnJmxA2J7zkiR7KNH0CS8xzzT
         GKaODvpf0gTrMTzguJNZjGg5pu87KeBOEcoR6S/R7IgpRQUtVhgOTfKsN/CEyiA5MrgO
         NbEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702722; x=1790307522; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        b=JNX3vwHchzQHvv01OHAwOzK+3YsK9PrbOnX5eVFKI0RqbfYQT6tqdBRRebryvPbc/V
         lINvoF5dDJTjKluZ880xoQrx0LIaE9znZC4bsypoIs/Esyn3Q3QEUlDReXQ+YKXy0JkZ
         fmjVxaTWClYwEKxruhP47HdK+7LbivQIUzephLA2jrmWFevXroecooqYr8Zukc2trUy7
         cHQCgevF6oSWkDJBUA1e/NZxG0l7E4iOGMfghJx2mN7NDWgVjp4i6jd9v7jRdGqyOaJo
         EjKOagF0VgTXS2O5rFD7lEIOAgPRKMIfveilSvXggZKKNc9rIZM7YJazYsBWQ0KU3FCj
         9mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702722; x=1790307522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        b=JZIE8UxFN9NztMhuADUy6+hXhaa5C2X8yzI9gu2McC+PPcaRlAozgl7Nh6NT8IStZe
         lOWePwPx8JFPi4kl5itXWEH+LcnREkl4Nb5LsOyOKRLE8ClVzUxhIjK0Ma708U6PSxm5
         MaZicpmGbA8OqWUF6DCN7XDXAP8DPe9O1gEhkvEblcxnMc3sTBRkD8hqyZKuaxQpWE3g
         goRWg+BBybrUWm2vSl2uKYqTJ/fBmFEGjBQwPLNgyrS4Q4bq6lixofDixuz64KHovsBN
         f+u06pQuXA22ILfuFtDTTDfyYevzhEv0jEewIN7A69fHO4Y+yRKB5a6ryeWPjwJMh4tZ
         Za/A==
X-Forwarded-Encrypted: i=1; AKwUvBw6wg76YHy3Ers3J8jbB1zLaagVdBT3i63wv7lFSY2rgxcAQTdttYPbttg3pWXv0i66B0rjBLDOJA==@lists.linux.dev
X-Gm-Message-State: AFuF++k7oKF6/Jh/iCOt5AjWzgqY+rhPBccS4e5swhWAevw8q3uxgcIN
	ukbSn5MkfYTed4reItlZufSjg7xORnGtrPUCwwSrm8feRdzJ/h5jlHECsd9RBlsuzwnImm4G/bs
	tzd9Op63lkaCZUi9zxxSvcFVR5xLUeew=
X-Gm-Gg: AYBFou3RgvuQNJEwocAdwqLTgymjHpxVwd4Vlx9ucyvdp78D/iIv6WhzHw3YHNcALgk
	Dp62pXphjbOKCVB0tdaeQ84P196dabtGFp0LwNJqH4k2xIchNUhkuvsNs8AfBFQPwEznGTyxJ24
	emXArDK5Z17Ij5POB8eezxfKNxxtKLKIgV2eXqNvfQ32jsCWH2iWXdIkVMmWqckCV6ar55NINzj
	uogbigKdn2OzlyXhM4xcuNLBO0m9lbagWTUS9T0uC3B+/IJJPYaPyPDySFMA7PDj3hwTO7UpQlE
	jBNA5dODEYw4e5LmYKNOxZfUL9L3bqcohochEtsbeMjKiPTvi6N4OrpBwwXCBcaMIg7vIMGb9p4
	LY0AA1BBm9aT3r+MZFAhpR2C+xaF5wXJEZN43qLCM
X-Received: by 2002:a05:620a:272a:b0:939:e129:c348 with SMTP id
 af79cd13be357-93bdbc1d9f4mr157765085a.20.1789702722054; Thu, 17 Sep 2026
 20:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com> <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Sep 2026 13:38:30 +1000
X-Gm-Features: AcwNN1Wm1pTjO8Zn_ZHbQhmgXWGrtTW3gy9lIDVTkxKs3v48NgKYQAqx4Y5iLC8
Message-ID: <CAPM=9tweFRWWjCrkBKvR03BaRVs=N+-qw2ju0g-dgMj+S7Q=ZA@mail.gmail.com>
Subject: Re: [PATCH 15/16] gpu: nova-core: mm: Add BAR1 user interface
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 14:25, Eliot Courtney <ecourtney@nvidia.com> wrote:
>
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add the BAR1 user interface for CPU access to GPU virtual memory through
> the BAR1 aperture.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [ecourtney: map BAR1 in NovaCore, borrow it in Gpu and BarUser, no Devres]
> [ecourtney: update for the VramAddress raw API and gsp_resources chipset]
> [ecourtney: drop the owned GpuMm, pass it mutably through map and release]
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---

BAR 1 and 2 need to be optionally detected and used. At least on SPARK
there is only BAR0.

I've been playing with John's branch on spark and had to rework this
code to make BAR 1 optional.

Dave.
