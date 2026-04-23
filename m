Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3922236495E
	for <nova-gpu@lists.linux.dev>; Thu, 23 Apr 2026 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931919; cv=pass; b=TsaVKA7I4dlf6jys2oW5eVXSQpmL7FmHtdKKBUNUQvQdyvnvH/Hr5JtpbDkCZnFzvC9gfpQ3lnv9uR/4IMi7ouOGTfsr66lR9s/n7MIewJKuVSo3zNe9kigkVgXnu2sev3+sKIl8ZEerxBmVYi15v8B2b01WIIHzMP1fP0h29Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931919; c=relaxed/simple;
	bh=lNmi0SsrPjP1Omm7a3F2e9tJ9oOyG0fuF6xiUHGFx9E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mwK327UJjnKSy6sk1eb43hSheZfMvgLc4ldKV1nH1oY5BrE/vR5sFk4euj4rFXdckfeYQJwo7LLO1dTX41SIlgpcyqqNy+mB472jhw6Ai8DpsViJ6FuWGNimcIBiHBYlhIVrsA+2L4JADxD2/7ylQegpqiyZ5shPfgzXCM4w/yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=afMfs4Xu; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="afMfs4Xu"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ef10ec84cso4860603fac.2
        for <nova-gpu@lists.linux.dev>; Thu, 23 Apr 2026 01:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776931914; cv=none;
        d=google.com; s=arc-20240605;
        b=M9T9Ztv8t+JQExgNkAvJ7exSEK4AOcCGgDqL6XwPJS5ywWx+68xCAwChqqVddox9+p
         ijFr4vp19S301vBAOp9eXLiRd2B4VLYTcyOikKnXLsiVET4zkBSWRIa/qjxQcH2vAAIy
         /Qva0NKyO7qoGU+DDUoTLJoLHI7ursjk/VQQcibtzCg9UToWXIWcMi7zU6MyOu3u76gO
         KfK7XxN3Vkjzy5tFJWAvkw5LhOd/8cYdSwuKJZFWChRBOTCNij9gMzyECgYfpioSDudN
         4vsvdnJrfqDZ1JRh7VDb5DsmswolTPe7I00nPLxv2U0SvFKDKmPrgvwz/WS0HVouT5ub
         Nlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lNmi0SsrPjP1Omm7a3F2e9tJ9oOyG0fuF6xiUHGFx9E=;
        fh=XfYYKbSvJ/qa7BpzhKs15BMx9ORNVTmgW6BiICcLNTo=;
        b=FGheI1jzSgNZKZQgDX7e+UDHbM1pZJ77FVQtIJqrqD9rIekO0cK08bNXs0lm/7KYg2
         V8yhFPaArBcQazbuLcf/Wceq5zyGgas4ElE8iQUTzGNJNAMrFnOFOhC19RJIKsshgt8T
         FUM9UVbe5MMGRg0cd8aazPZ+T5sd2XLJIj0X2gpUn4G1BmXTXKmzcGLwUJnczebW3akV
         VhN4MYx7xX8hVmYxNMLFiOsIxqf6mS/m6d3L6XCcXnfEKr+kpyrjZCADXueC6vzwHwS0
         2+pRFzcNiTnRPcNmOjgAfNIPdEbIDFEZBArRmXAqYew7dZ1JKrZMYrx8fmDijQhtjMoc
         159A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776931914; x=1777536714; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lNmi0SsrPjP1Omm7a3F2e9tJ9oOyG0fuF6xiUHGFx9E=;
        b=afMfs4XuSupTSevzPk2B17Tkn1WKEJK0I4LDndt7Q7+bv3Hno3S2GaKSKvy0KU6iun
         RIg2r8pKZcsoFkOqILjDYNdG3MSjo6T7WIUurnEb0W2ZIpeOLorymzPyUfkQouJlsCFL
         EoQ55db1Cu5yTH7JkBlUqV7ccGxjww+O+zI5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931914; x=1777536714;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNmi0SsrPjP1Omm7a3F2e9tJ9oOyG0fuF6xiUHGFx9E=;
        b=EU7uSve9bNG62nxe8KmJcOvj2jFJ4mqE7aqVoNrsInN3bQpMlFNO4OFvgOyfsqlA9C
         XeFFXfH/BNPUkPJL6iFpOd/7+IaPzbvgaNlyawhh5jOgVlpT3lEGxh5fW4tALH1DF8HD
         cZ/V+DzNhIZ65hrtVi5ibrfgMedyVsuQ4z8OWTNLrzvZEJrs2i5C7cfJyVitRjgMtKIl
         8/xLJB2tmzAxQ3D6X06Wn2r1fEh13NBHAdUk8DBqF0vdsA42Iy4ePnxO36mGJdXBBObn
         eZhigS4MTfxY8MAU9y9GyHcTh6YqKR90I12kdevwLdqPnYDEAJ/PaWHkpOOnp+b1YKkH
         Kq7Q==
X-Gm-Message-State: AOJu0Yym02XvcHSZ74Xv/djLKDhsvuYCfrSYRC4E9uBHNd6J+C8WNSOy
	ruaSpThuEi9ZcBD9xTlaDl/K13C8VjPWJVDPSkPFD0w0F3mPJ95MDo2/UZB5rxVfZwt24Wcwjxx
	zVpzSvSfcB4PqR8WnzzGhOBi9NpisI+6ydZ8qXmjAnKCICsb4O0kX8og=
X-Gm-Gg: AeBDiesabUTTiCV/My8+m1v4oQgF0SmObaw417IuVBcDYvPSmX0Nii8DQt0zowKINJK
	kGXmYDVsbLpGAi4n+al8WZk358O+Z+ABAd0iq1XdZRUFihsSNkEB0SW0dZNgbQHgLc0z7uOL6Jr
	e+k9LqYBIOU9295LzneZmbnPZ1IrbjbFYX2J4szvR4gF2I0gQhNY61CQuB35KYffXcI0jOqsZg7
	O+MUhEcLCrH/xL4jScsuvz/AgPiVWq7Zt3S2sKi+WxXujvsTSm8SsRsQjvLVfAQUGhidWBamY5f
	Hg2eucG5sZkqKqRZq7A/laJDQDK1Dc2sQCRdDDsgZYImDGF8
X-Received: by 2002:a05:6820:3082:b0:694:9d0f:cb50 with SMTP id
 006d021491bc7-6949d0fcd24mr5380665eaf.27.1776931914441; Thu, 23 Apr 2026
 01:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Thu, 23 Apr 2026 16:11:43 +0800
X-Gm-Features: AQROBzDCcmT5drGEFUh_49lb7HXBYF9czGwm74wc-LS7I_YwSOfueHidHm50Nzk
Message-ID: <CAKkv+gzwkdwnBOM8C+H03HyHs5zp4V0g-pFd+7mW7yVkz7wrpA@mail.gmail.com>
Subject: test - first post
To: nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

testing 1 2 3

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
