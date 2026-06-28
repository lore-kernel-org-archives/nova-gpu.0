Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FC42E6CAB
	for <nova-gpu@lists.linux.dev>; Sun, 28 Jun 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640818; cv=pass; b=ovJWxQdEU3rVnjaswWdlc0APgIhgaIiVMNu1nFrFzdp1zRe3/1aD6xrX4x+RZBhizpa68GVM9/5BHAS658EZctr9ChmI1xZ4YXa4weCnfjQB0rOKXpxYoFiC5fw/UE8FSthTmFi7uxHFuO3tlDDaeXfW0csmmBGFCO642W/7P1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640818; c=relaxed/simple;
	bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRMfHh7uww0mxMtnsW3YEBc6H/pQKvKwGxaclCuwJM7dndUmq4B6dLyuNCYRdZaKwqyM1oRKwycF3bQ8BYMnQJDJRr+ZblA7ZKRC9TaCZsPxrzpMAprVU5oyshtOumamzu1qfl6hQI1kQOt+S4ht+gmkaAY1CUBbopvLYUi8S24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Onzy0EXN; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Onzy0EXN"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1364ff8099cso77854c88.0
        for <nova-gpu@lists.linux.dev>; Sun, 28 Jun 2026 03:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782640816; cv=none;
        d=google.com; s=arc-20260327;
        b=hDd65tSyorWtA/puf3bBN3ZVgB71MsXCxqgpj83SZq/1cjR3uNiVIggNd+iU0TV3rC
         HJSf3XnrvrBQgtHI8Zy3fICeQNAbAKIS53SJUp9DIBKVBPmyqpEbiR4SAR5pMnJFdv7Z
         gFXM/khPZRRiW8CmXtok7+DTl6tmw1ptSM97mJ9+WjgzCsCpH397OdY5480UeNNSF9tE
         EYoO8YAtPq93bgiIOJSiteA86dxOM9/rUzxIHSbYF6ZbSdxYSVWIDpeX/r26TOrmV5la
         6cCFeWJcUrgC9pVfiDdrb0HzFXd+6KA6pOsopg4zbY98JDWEOgP4kjnp8JvXLi3rn8U0
         j9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        fh=UxoQ1n98edDmwiawYyVPFX9QfcPIzEEFUh9pzpdLcTI=;
        b=MIckXbGwk+rLTWDiXOA2WCJWG95UAH5+b2srGaLG0cUTSgYBmQNYhyHHFnocnYK5+c
         ETacJth/ATIoIY/TTMDUeWNMmlVwVqChguXW07EuNlAOzD53av1nlf4a9eLTRmTFk1gD
         uZnluv2rCInNXPF5Y87p7J8G+H/+he1LxpREJoDITpiFOmEYrYYbyc4bC1jCfmmAMbR2
         Jn3QeQZ/ZSUdGtAMjgpBOFqt6pwvUHC/mYmuCSxyQ6sfanxCkQMUUDYiKrGUbADrzVD0
         OrxDY4RMoF1ODoTBJXaeaquaW9bU8Q7OPRxdeUEDd/b76I+2iFv7fDl2VHtTg5yIHDOx
         DhoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782640816; x=1783245616; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        b=Onzy0EXNd2x4TBLNcMiTWfjYSxdjUDjoxGBvhHkbgHzHgHcXirmo5jCzCnvLCDHYNf
         oo68TODW2vEg9jFPg/W3msJKj2KEyTy+j8lXZPQweXkwhzWJG0ilnPyfiP0V7EttbfcU
         YyW7jh3RYXbKrnj4Y6iAWEnBqQZ9+4Uuyl8xxwCDYHJnGD3edUgz0xuwHs/6aYsT2tH0
         8ETlyFtShCa+lSU4HDrzv7HqK2tzpxX3cgK94J3YQzPgUPLcDvHlJmF5rBXOanqqL3UQ
         uVivhIOIuhYkRjiCdM9J6FMBm/AZlJmYCkoNX00fZKu6om6sbYTeF047e6vj5PvDowBb
         kbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782640816; x=1783245616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKOr+bOPAaEop+QOsAuBUUdGUuxOSw34AqHhAUajUjs=;
        b=gAhDRl2XsR4DQ/MUBiFwK63uC4HyDk2F5JLUmGXZnpc74ZyaRh2IQNPp4rkY9Zivh3
         chP0xLUitjrCVkwsfpnVAypWoUhGL9pjAJNe4yKWvLlKf3VTPRWGygCqV/FPMUyDS3fs
         jdtrvuisWV+uxcIzflnoqddZzgIXZG/Ba51UVWML5UouCRYaTRZK5q8UMRQrM6uDaoLX
         7syWrNbaykehiG2Tu8oomgf5WbljdVrBbRHCcjwNm96F1TtZX08W57UJFTJQ/cAT5BOF
         KaEWHLDybKxVO5my5bKRj8HAsWBN5ZV69m01YsAyhh2PjzmX1jzJWrkfz5pXSRmwMq6K
         X18Q==
X-Forwarded-Encrypted: i=1; AFNElJ85dGCuba9AG0ERug7ye9IUq6k+J+iKT8TqSeQiaOqmGYVZoSEqpB6px5MOOGN0mTiXEE+TqOkh3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWS8Vg3Mbdgm9898vfN5A4MKnzTnj0qEZHJGfQdl/HfyOaJ9YY
	1NEV9503e1DZJW82MLBATKdeErBdUT1rMHftU+v6//UJCpArS6rzvSKxYz9W0mk7sh5HqBXp5sx
	F1kYcNCKMa/1/VLnwdbrRcqvysM54gts0WMkP
X-Gm-Gg: AfdE7cm4BcD2+sw8LVr2MH1uUS/eHh3yycI3nthgydoBqWtESc2JXCcVTWEnJ4QF81/
	/SRzlaw2M63srN4wOe+0JxQ+olCykJYOs6RxPvx1Fvwg6CxhmwiZiTS2ABN018hxC2W/RK2NGK8
	+6l/B5ZyJUB7WeiVeujHg/iRctTw1jtqw+87lstVPp+Sq4ANbaQ//YobbkLeZe0Qkhglo+OPICh
	A46nfA+JWcObYYTIZXso0TZsTTazVGZo5NVXhiPYuz4+AnUa6+FKW9n9TBnedzowsFbGLZEuodD
	YCubswkAmJnFlQ5+4kOzDTF6N2cRfx/Qpaf78mwNQxJgg5qhD8Rxxb+6ee11ZJZNkjx7wbQ5sxx
	zAaeMOcSDxwDw
X-Received: by 2002:a05:7022:459f:b0:138:2790:149b with SMTP id
 a92af1059eb24-139dbaec420mr6043173c88.7.1782640816464; Sun, 28 Jun 2026
 03:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625205146.5047-1-niyudi.honda@usp.br> <20260625205146.5047-8-niyudi.honda@usp.br>
In-Reply-To: <20260625205146.5047-8-niyudi.honda@usp.br>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jun 2026 12:00:03 +0200
X-Gm-Features: AVVi8Ccn1HJ8X_hAz1-AEqOSd2k8M8FF3q-xf_jEPBCIJBTgp3WrHNp6qT-BDlM
Message-ID: <CANiq72ki4YkLKUQw-iR_GcF_ernUvN75m8VdHCeWmQh8Amy6Ww@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/nova: remove unused trait in commands.rs
To: Pedro Yudi Honda <niyudi.honda@usp.br>
Cc: dakr@kernel.org, acourbot@nvidia.com, nova-gpu@lists.linux.dev, 
	aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 10:52=E2=80=AFPM Pedro Yudi Honda <niyudi.honda@usp=
.br> wrote:
>
> In gsp/commands.rs, remove unused `transmute::FromBytes` implementation.

I would change the title to say something closer to what you have in
the line above, i.e. "removing a trait" sounds stronger (which made me
look into the commit :)

Also mentioning the trait name makes it less vague too.

(The formatting on the import is strange, by the way)

Thanks!

Cheers,
Miguel
