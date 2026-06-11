Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704038F25F
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167888; cv=pass; b=qcABtb0DPuAtMxWygmIQT14DflFDpDfPPhj3B6820UMUHEdyjDQCl/iuf1GiiWXbK+kC/bPqzepNJc2cTkIzgr47GjF9TyGh7R/EMG2KHz/W7EmlOufziPoWB+ZYvZHSzDBxijhDU8jXsODsCd+KVKLG7UGxhPfTGV594kbQr3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167888; c=relaxed/simple;
	bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5txF6KukvJRqB1UK0rpr2k5nly3VOgFBfYB4iXOekkKEc6FNRd4M1xtTTwnRsQEgbV0qhXvfHvyjHw21AVwZZnvbp997O5wHuYOvakThKqC/VILkxC4U+kGulQqGiYAklzz5qFdbh9MeATlzz7F+hUw4iWz7b6Ve60zr/qUNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNGUXRBa; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNGUXRBa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304f8e80b7eso592174eec.3
        for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 01:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167886; cv=none;
        d=google.com; s=arc-20240605;
        b=Leq3uxIFSsZi2lsCdxJChd1wKyHtTktHQEde4OqwP9PPrPkTUPYzwuj84uZ8XjYqVz
         +7uM6GGgV0Gynt4QanodWTLEp5tFdwxNqJ/6WLssVWEaVuw9jEuQ2eKhFQrwyM5Mwb3s
         N4TKlQVaxiRZdyMUdrOgTsSmS3ppT/ZXLl1aiT56IT4IDpNSLs/BNOImo6QtDG2aD1Lr
         mMN8edodHBb8BqrPUO9iwWX9dum8IY8cFDVRE4fkPfMLqbFoqD4XZHARrO6xzJ1e5MOS
         rkVYmiuo6h96tBFoyTZc6Wu9rWVC8Xv4IyXcqrX9BITvxRsztZp53HDEiWgBkvBd8FR4
         ZyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        fh=N2Yl7nhi+Vf8BEschbANJUKACVqY23aiQkKj0esPc2M=;
        b=A39B3Pgx05qV2rZ2OhfxQjJLSN+fVoWZKErYfqJBJ7zJXKe234SsFQKOOSlbTTkmYg
         ifA9DldluZS9lVrDcBBBx+Fn5camN3LYJkvMgNaLLHmsdlCxNESSdLIRi7RgEpz5lFQq
         U7w1pMHSU20OWIz5RzLgJg4Y322bLudE0AoGgfr+Mg/GT4J/Vp52pLnxVNj6kvqtvIdh
         5qlN20FSlyMHZNuy0pH2mHl309V6cJK9ysELI4J8Dv2eXuPe9+RLQLXqgLJdosAiRZTo
         8LWsfGdPoUNGreQBDOnU1SN1y7BJIXUua8Z6TCZ1QMhOi6si7y1bCdgsuCOQyWGKG9dL
         2mbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167886; x=1781772686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=dNGUXRBa2JKnG560ek3nvpW80oC5phn950kRFp+e/v4jTbiGXWTHDtFhMro+xgmNm+
         bB8joeXtWmliEnZw50PwS+tW4lUHcLQx/UkJvqPekq/CLGY8wByfxx8cgl7czgUHlZUk
         drMkPG6m5eCpfMiUhsPbC3FRtNDwarPRkuc76n0Ht0AEKA3cKbzCzYLOzlMStW+7BG8I
         +xFRTd4dDy34VySBj24QWuBJsRtcYD0mSG5QAHKWK2YElk6bzfTs8tCRgP/Niq3MZZz6
         eiGI7MgrUyhbk1HvqsVQb8dT3R+2tIv6epx6l1+sT6K/e3GuwbI+s7t2+xYwSC0EVWv4
         dP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167886; x=1781772686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=aNRjhwHctNi81kHa6jETICdSdN7Noz76bmFEoatzNb/EzCuCOW9nb8ktp8QFuMKw5U
         Z7zZ3rdRb1Wk7nB4GD91VK0WB/pdEc13w3BgAGv9CYlUHo/xDsN7rYUH+kycE895i1Xh
         xQS58bC8hUBceronSuqzqxlLbuNlgSvFlcvcg82xmntI6HrDcJg6YbgGcLTwfPoJM/KY
         d6+kddbLcuYZ55MBR4KdfiL0DTTcpTdXnoNGaeW5Uac2aagKieAOvUz1ls9jpW2UPT0D
         4fUQpXMcf17fulKWdicnQEB6gC3wwZlk55oYBakGmdvTQDy78bzpwjpTKfvJOJGVpjAp
         hPOg==
X-Forwarded-Encrypted: i=1; AFNElJ/D6Y2rh/97R64M5HaWqTor7qABoTKaTb0HNuwhKGY234X6JJ5k1v220lRslPQEaGxgcMgjdS3T8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YywSVVcP6fxhTGxno/cDCHIukRdszLnjoIF1VnQTyZGP8KKk6xD
	tRlw5LqVyNDrpMcuz06Y6BRHSoItyg3gWEVEfy9jISbsworlMB4ou8HNoDsMe35UuqLnzduobyb
	CaC0DryEDeBqrNnFbjna3eG5p4OE72d0=
X-Gm-Gg: Acq92OGI6dmH++tki7zSeb0RfzVXL1ULKU+2Ric74JITKCCgBZWSw+V+xRvcdkprA45
	KalsMupWA/dOx4mp6yw6hPtLLHYZzQPNbsV2HPqAQqrE4JNIQl67A8cBWy2ERWmsI8RSugSRUIi
	zGCaUGpX1l+MBIsFODekMG9VbR+YzeEgWQIKFzANVLTqmepmgD10zbmkHokRDBQz3Rj80VfspGN
	B/NnKYaZFDHjWqun3GDyynhM4BpA5GDXX4BDqA/YKWNI4RnWXfxtWv61GzhdaqG8Md85pzl7QUj
	nKIlkfrn323MMCrTF0CEnnnxvxmYhMSEh50dt1r5mDdXR86vJpbpDv7e4En9K1GuvdxgMnUnWgl
	+RekC7u/47bIlFX0gTBmDOWKWGopvdAirdA==
X-Received: by 2002:a05:7300:8184:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-3080410050emr652555eec.0.1781167885763; Thu, 11 Jun 2026
 01:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
In-Reply-To: <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 10:51:12 +0200
X-Gm-Features: AVVi8CeZqdEWXPdGh8thUTK4-wo6B8DARvooPGXEOY6tr17NX-f1ZHtJHf1zMrU
Message-ID: <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org, longman@redhat.com, 
	lossin@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	netdev@vger.kernel.org, nova-gpu@lists.linux.dev, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, will@kernel.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 2:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think if the re-export is of form "use crate::build_assert::*" then it =
will
> still be the same semantics but would be appearing now?

If you mean a glob import (within or outside the existing `use` --
same behavior), then that makes the glob import appear in the list at
least, which is an improvement because at least people have a link to
the module (i.e. but not the individual ones).

Or do you mean something else?

Good first issue?

Cheers,
Miguel
