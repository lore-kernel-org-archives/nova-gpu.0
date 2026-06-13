Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740A36D4FC
	for <nova-gpu@lists.linux.dev>; Sat, 13 Jun 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344166; cv=pass; b=ezKGbFgvshm12qOTqLwzERZ/INDvr3MBw9a2Lgp55rjO6twDkdH9pF/1Yn9LEx85VewTACem6ZTDRLxMSXliIjBXfQBccrwpF6YOLTqOanzpblAppnJC0le4C1qPiwyN2RZxvhoBkqPsQMiO6FbaypfWgODNnFxUufAJlvrXdfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344166; c=relaxed/simple;
	bh=N+BOVUokZvEKxogb7woXjEf8tUSXjSp7mQH0tyGXKLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzCirn7ztYKznj3dwc6xV0t67IRV++KSfX5ISmwGTJ6QxRI7ulYHaTj/HPfSC2um+1YQPt/tO71SG4f0sLy5uEKM76X0iSs4FWPwopVuEldfHHdDb49b+fmIq53CHjdyvjw1467v0jDVs+5m6KUgu+hJKeMTRugIH0qxoYUTH4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXWeID36; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXWeID36"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f8e80b7eso158567eec.3
        for <nova-gpu@lists.linux.dev>; Sat, 13 Jun 2026 02:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781344164; cv=none;
        d=google.com; s=arc-20240605;
        b=GvXy6hSMuARlkxdX2CaufMZ1SrmI47JawPkCfXgzI3U3JPXNhpO4D4hST6zstKZLXb
         q5tSaSHfEzJ/ipI5QFi5RW8dMc0e8bOnKFd6biDI0KkROaaW8vzZCcUuxxdndFvfNIis
         gZYgnzdVED1OqalKB2+p9xPnBeOGJZSYP0UjjkTsPxN9EbaPx6VJ5NbVUaqbZeDFruim
         D9d2123WOjCdN+oXooCZxoGmAj9sn60TC/xdD6zbdCGWR4ZSIien0I+LsHvozPn30Aqy
         x0I1Z5KD6MIaBg3N5Fym6pnE2rosxQAXm+QmAki+WCRzBa9I1VX8OIm0jgHsVwVGUqoj
         jY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        fh=GFuWCR6LAQygqDB3zPUZ6ZsRT9NiEb5gIEBRK3JM270=;
        b=BMUztrac/q32U2Ze8uMUg1OfUm4WjHUkhXz5daJ3LzLKR0LUwtbQV1tsRkbvM84kfH
         Z0kDfD6ed5+h4GfXd/L9cKuqiixAKKw3tv3Qi8mJEK7QVq/bP007RnXvUwO2gO9dN55K
         y018u/La/JBabD9iXYGIJdOtEa5A/R9duDvSmCe0YkLXzJRVOe9lmhZXctt6nGZaVNqk
         FiO2bW4r2CXRoeFDi+YR5d9tRhrV61Zw9K1rJ7N7ZDXnhlpoJkApfLtgLvl5Yy67msU2
         c46NRY8YmV6jmNUEYEIwUWJXm0fC33ti0Qlk18VKGjQTNOgsGXFGsU/M4XZe80B6TxWC
         E0mA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781344164; x=1781948964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=pXWeID361KYC7EbArxTrBy7E98blgui7XFdPXWBvXcmL3ADgaiJYOrNpdqgwz/P+3y
         1nW+hL0QaLjsfbn9Bdqb8F+7WrXb4LU0VzWgXw7rEIzioNp1xcG0GW65Ie/noR6Fhh3C
         j0Lj4ptbqkC73jhNKPrq/A2H4+dMlnHj84nJBHhMfIlPU/sWuQR5+BAnVpHeh/DU96yx
         KkkazuscWpBGFV+UHUdXknrjeU+6nw5kP7+hFahBvD5dWqhC7sTEmN2H/MXZiFIl5fCR
         tmuFoKfiBXh7fjI6vRQmyWWNbF7z2Pz5JLBP07A7td2xDwe3toFSbS2cZVLt0L7m7pxP
         3rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781344164; x=1781948964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=sc6sjnWtZgE57y/AX/BJaa1r73E17HgfUTwNJDiMGOfPwBUnTN7Yu+tlNRRblpKj80
         InJIbUbrWtFP5JNc5noTuQM8uoRuZDbRTzCrf4V3/98jA+jsUh4SYtAj803erV3ebwf+
         KGYA8ifL61U1Ir58mksS/GA5oh8u+l0VjGAPzqG38OaweHewBB7UFYTvH9lVXg1DdTQ0
         lg/PgTngdBJGvD5GFr8zibpFaQFpK+bI9vTSsVpW4fMjyWVB/+akDSNMTWdmDW0Al6En
         nHUDp/l9KZvNO9AuoXEkbJcwp6uizVyM0yw6AUJ9rYQR84A1RCNBAqm5Fqu8T3KwwD6b
         DAfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kfSSB5SBUxayzaMWRazW6NLGES0fTD4VULTh1qqQZnXACAxPaE6zNfI1G9agCIadO+uKzYCHLOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzV5+Hwxq5R/v0S1d3IUPkDDXyQf9GqHcdp0fKAdRHTci+RJPp0
	Yn5KxTIHDaK325V6jv0w3XnoBWa/HY0adPI1H6Xl5miGWwhaKzVT2568srRQRsysUvVVQuiApNL
	xct/ybOgG5Kze5xcEyJh+V0qgvRwzwnQ=
X-Gm-Gg: Acq92OFePM3hAOoQq8zXL69lycl9eOobMnpQoju0bbECv5gSatcZEolqAkAc9nbjAPQ
	aRFvYjoBbwMVkQCPg2SgfHHRNWh2HW7Q3nxjnnu3PK9dQJZNKLMa9ak8RN6te+BGsgIBeRU6J0i
	Ntlsc3KKi7iZg1+QZmBaglHXRfhIJAgDdXsWd2JP+NgyyPxej2rMOItZvUeky94OgZG+hxC0OZh
	qjnrdqjfCXVhnKCixT7gSCc+Vu6lRNJvDUuj5bEmNtcNjG8zTUN6PdtwoFPGxXJuAqblAjPXoPM
	Y23+DTnYc/OQZk8rBSZENMamTl5gT1ns+ckG6BBvZpvMUKClij/kx7uquaT72Xh7iOxOqDu9plv
	n5kB+1Ym8Ez6wAOz7E4JJBhY=
X-Received: by 2002:a05:7300:730f:b0:307:2e1c:17ed with SMTP id
 5a478bee46e88-308200d09dcmr1479282eec.7.1781344164338; Sat, 13 Jun 2026
 02:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net> <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
 <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
In-Reply-To: <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 11:49:11 +0200
X-Gm-Features: AVVi8CdobUhfSP0GVHy-aYqTcvmFqhk07mdunfn978mPaEmklHiQcpFapjBPE1g
Message-ID: <CANiq72mhdy3i+X-9ZDiwe-mAYu9DX2B29dQQi=2iAYMS8JMzXg@mail.gmail.com>
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

On Thu, Jun 11, 2026 at 1:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> > Good first issue?
>
> Agreed.

For future reference:

  https://github.com/Rust-for-Linux/linux/issues/1242

Cheers,
Miguel
