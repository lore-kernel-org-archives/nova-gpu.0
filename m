Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1A559300
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707686; cv=pass; b=R1FbSkc9JFF44y/WGMUAOmIbh1rND7fL6X8569QuXkZkDjEKwY7FX/4IQoYwShK69UjWxnb/nbjrlljHQ0UyQPB0TdmDOxIvH5STXUkHgkeQ21lvx+cDBfOTKdu7BWQiPr1Tb/PUwLA9Wa8hlnPfnl6cWvTd9Vpdy8oPhBv00Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707686; c=relaxed/simple;
	bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lii2yyOygcld80LlbXbBqE6uP/2EELJb9yH8FNMjwfBS/bM4+UxK2DjNafRO9QCsNo/wp9vtWfSJZVyuu/vp4SZoWVih9Z9P6xrROP1BRbV31jJOC3goCCFLqdj3CcqjjQeQauAJSgtoz0ZLW1IVMn3EUwGMN7Wsa8Nn6/pyavY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMJLNL2N; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMJLNL2N"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so90650c88.1
        for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 11:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707683; cv=none;
        d=google.com; s=arc-20260327;
        b=kTEKlMTImfHlDAmE8SBo7ZYQLBwbT9MgiCPeurPDJBMcJ2zA2M3/Eh9CFOQfkHNsDG
         O+Jz9OHNjRVi9ahZ+bZFXdqrM1SISlvejvC7TDO6gtwkW6CuYkiKCe23ryhft35QSU54
         XIaL7FScn5ED3a1ftiC1lJtapWqJP6hluyUuXILx2yAkx4AIITzixDFrY+pH1LX4i6RL
         De6uD4Kwm9QEngJqnEYDKtrl9NjybOYKhyyO6bn4uFCst8YvOxx4PLyUMrqrQwkhV9c1
         AIgU8wggLX0Z6enGNnaGxXWKUfhV4opFIsI8Jkne5bOZwkp6C63NjvjLOeklRJDgdzqv
         LCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        fh=1h6xAGAmH3FkssQghvzo2k1jEvu6gQdLJLQ6tM2c7Ig=;
        b=lvJDNErqWRZ6x+Hzn0eR7wsyaidfTcQ9N6TupyqjVdqSfubH2of9JkYMANCMciqU7N
         Kh2yMjkpw/zLqKIF9l5PGsRwFh7oEcXsa2NWElNjT5IoRZPdV6LL0Zp7MMQTD0VNCrWy
         Xe4v1UI6J9KaBqnJoLSSRtfGtu4Suxkd974CHg9WCFrOJw9Ndod5jD37/3r74ssi3kt3
         L3r+4YftBkV4D6eIEQfYuDh/rucSp8j+BmbVlmd8gunaZFAiYT3vONHCRwvndD3AsGZc
         LvqcqTsEX2KuQLhi6ao0iiG1OZIs8VSNqFXjpXvSSJLca2gI2O5v7YerAbI9sSPLVirr
         2zzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707683; x=1791312483; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=RMJLNL2N3l7L/aq79TmiRxi0ZfMyWKFWGrSh2f13HDBuB96JK+h+AqAFZ73+KKj2bk
         RWGXoXpswfP2RO+DupMU4JWhIjC9FWrw//PxcwojmwrVnhyKjSCUwRKiN7jYizO7nLp0
         K2ewFsV+3biyGr60zIFu/Z5hEaqZwr9GkLNBe+QvZw4OZxBbA4LXX3PS6HvlpkCSEYhB
         NyrhYtC8LyXEcCdmE+NiQFbIOlQ3wqWybOvfYB7+4wIc3uN9nykldCszsbL8KxbZ9/+6
         k4c6brB0IgU7V2L+zA+ouV8EdScg0xofTQZ8hgVQJEbjaQGuJDTDT0Wo6S8MMX7yd1aw
         V7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707683; x=1791312483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=GgVnttOrjXHj8YpUsAZ06HI/eKVJ43yqxLGLeV8wpFdDl8PyP/MRdNv7Xn74W7PDyZ
         vdCGpIcsVuOdpxeBeCF8ITBDoXStjZvcn0UFf7ak3Cpd8GHVYXuXLtt/W4gZxjKsspz4
         6K6Z2I4RXvRs01dCiBcXzq0exPjeLjW0fnD6v2ToXWSo+jdvWSKRrs/jWi4zlUthx2Pg
         0qPFV5fG/HvWXmhnEgiqQIYGXNPxJLw5uZKYLpD26qaa46YZ9+5aYsC3eyp5ogswJ09i
         VLoJxfmSTFApp6v4nZkKbFvVKfhqTbMgakwgNe1FpSSgYQQrnWu0Ibzm/7uu+UBAkWCa
         Pvxg==
X-Forwarded-Encrypted: i=1; AKwUvBxlJorVQP38kh4xWk30TVOJRkyi2v8IklI8+vXkQLL0ndvqYmhD4Kwhz010E70xNwPVPsieO7N0OA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIYKSDyo9oV/o/4SGtPxXe3w6A9w2cfkEXJi8CtG8iadHZGxPo4
	4eAurX14B+NKE0N85PTQ15gMPZ7bM/DUKw6Lm6CCxDSc0PGkvGAmoFnmJz5WDqLVpmCK6DawfCT
	dkisIB76BlhWJBV3SpAg26v8/b3ZDaeQ=
X-Gm-Gg: AYBFou2Q1r+u8h5tDIrg0ERUEF5Wq5RFxbjA6F/l+I3sIKYPs+Sq6MIrtzPBpeTq2Ui
	k6L7Knt3jKCSSiseA6u48ZXfByfzlzkM1N/NafS700FQHoz2tetFSWuwIZEWDyetcJdzgKvSVFy
	rJmda5fLy1Nb3FW3EANzxG6guOipSAXUq9kTF1q4yg5SROhH8O4MyQcaV1UfEwePqD7F7uaHsNN
	iSQHpv1kp5hFeNLZ2oO6sdpX0w/0b6izXBl4Ray3n12da8iCmivGe2yhNwDAMmASr6QhSw8Yzl4
	spSwwXXI3/u0dFWpYdcU/vgSI96gykdqWyFf8Brl0Fz1KMyfzpsji7zX/BPTSHpfgGeRoWyelTa
	fo6CKs8ROzAt1pNuuPQt4My+OC1L+hNnjYLf2hjmozphrWlI0oKVGbugx+08DcMDT57Ed5Dl8fK
	NXzTTC35vyrjM7GPSYEaQyqn+ZwBeH0KapnYd02LdNc6/wwCoPb+0=
X-Received: by 2002:a05:7300:d0ae:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34c65a6e7f8mr375267eec.1.1790707683419; Tue, 29 Sep 2026
 11:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929135855.36775-1-chaoji_xinren@163.com> <20260929135855.36775-7-chaoji_xinren@163.com>
In-Reply-To: <20260929135855.36775-7-chaoji_xinren@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:47:51 +0200
X-Gm-Features: AclHuK863ebGI2IXnXKyI5Z8WG1aeHKK_SaCRYSny_74NDfJ3eAdiAl5z7WrHIE
Message-ID: <CANiq72=ciUBTJJ=SvdrGBpNp3GvzA_m5NGeWmuCgypkFA1i-LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] rust: macros: exercise the intended conversion
 doctest failures
To: Kaiqi Guo <chaoji_xinren@163.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:59=E2=80=AFPM Kaiqi Guo <chaoji_xinren@163.com> w=
rote:
>
> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
>
> Link: https://lore.kernel.org/rust-for-linux/m2qzr81jrd.fsf@ip-192-168-1-=
196.ap-southeast-1.compute.internal/

I have been seeing more and more lately these newlines between tags --
is there perhaps a tutorial out there mentioning to do this or a
script that ends up splitting them or similar?

It is especially strange in cases like this one, because the Link is
for the Suggested-by, no? So logically they should be tied together
(if the kernel allowed newlines to group tags to begin with).

By the way, since I am here: it sounds like this could be split into
different patches, although it is not a big deal.

Thanks!

Cheers,
Miguel
