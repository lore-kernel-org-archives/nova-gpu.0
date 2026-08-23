Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6D31E840
	for <nova-gpu@lists.linux.dev>; Sun, 23 Aug 2026 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787502401; cv=pass; b=Ht3YuKQ5+en0SkeKju+zRsEIDWV3MeQCcRBOlNv0yA//xTbH+p5mlvcIqgWBGXZhkQV042KNZ2mCWHi6/oXv2FkxwONbgNYE1zJ2OprCsdOIkq+89PjFEM7+r89QU3MIFeSq0xLhknykVYvjudhrJON/rn/DS507fm8JRQAsYx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787502401; c=relaxed/simple;
	bh=7KdTt2qyhmuHpWlr5gWeuMz4f+4B5gmWnRiJWD8IXpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH4IJ7lq2rPZ+l4WLkdyAlEEgWurzf467AzV0NyYpKkyKp+OSdAz1NJfHXuYCC/diLapzYywuL1ZJii55jgWo6DA6DUfzo6aW1ozWXkSutE0YiYOHcCAnQiLveweGwdE8MK/4Wa6L9QnmM/cVW5xlRhNZsY0BEx/PGtDH7H2Vlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=vEzbnWTo; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="vEzbnWTo"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so1530059e0c.1
        for <nova-gpu@lists.linux.dev>; Sun, 23 Aug 2026 09:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787502399; cv=none;
        d=google.com; s=arc-20260327;
        b=UokYGdVXVGUkg4PwPduKL1Dr+9OYGoCyx7q9+Nh2I7DghdfpHkhYQAZkqXCWaowdg4
         iw0AVP/04YBbv4mY0DuKdtr8YWEb9ZMuVHZJl8FexVwcL68ka/ChnM76CMxRnBn2n/p5
         SGD8wAjWIIzPiAxjGRMMoxCID2gU8Ah8lPCeRYWASAixZJKaMEFhOIFYJ85xygDxwNIk
         d0jWTxvBRJ/sJmMbQ056jP/VyPv7YtSEZm7Ckt/uSNFYoeB8xgY1lFQ8a8kzA1yeCd0T
         P4W06CtPsFEqQ+uUzXv+SroUO/TPa2glJ30lx+n3JMAZM08QHMpbFIixBkpaQdtCMz2U
         LEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWA1KGnTO3EbMHd6NugYiHPec1zqdgPzLSeRr8Sduiw=;
        fh=qW1mzE1bvCyq9zPh3tMRbJe2jOyiIpUbZHhUVGLDpQs=;
        b=flrL8yEMbK6RwpAxfto+SCIL5eaTrR3B/AblaZ4IRmJxtFxmzFqyNvCT14WOmrNqXY
         hOxZOx0HFKQCenaXPSDkzbPIhp0HFn0NfRhu56qh2aM6GWKzsWHQZuAVM98q/CnvYPQ9
         2il0GyV2neP7svhZvW5s+qr8lBNWebfHzcy5ra/HiPQFGc5zHKL/miWuoqxXHdVyabJM
         iSzmeeVNWSziGFFMVGVw8apD9MhMnEjCEP7tjnb7ODvrS2FzzapHb1aAdI5Q45sJ5Pv3
         2C9cTIxfOY+1C0j3Ri/mJpIPpwX4lTtYu+fmNyC4yhXseblBGWxHbfooH1jWXRgGvqqg
         cwvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1787502399; x=1788107199; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWA1KGnTO3EbMHd6NugYiHPec1zqdgPzLSeRr8Sduiw=;
        b=vEzbnWToLNUBRon+0PGfcz4EqwSTiPDO/Tw5HYa8GpiLIyjyDKLO8KwwsiGwIX9R++
         cS6CInnNKrp1Yvzkk1Tn9w27/rObpbmnlcXjrenHSWdG0JZKzLAQRNf3Yn9rpX3UfMn6
         R2XuZAffr+J1a9kAPcLieGK+h/Rdq24OWyTzB0MVvVeexLOKJrNYjlYJf2Ys2f1/lgG1
         bMVqewt/ADb7+7tvKQ8CYVhPYnoZpCA6whMpoEpnkzqb7KO7prdhRlefxNCDVBQRZuO+
         XL7dn5YuHbSA8SAZJuuW0x2Xvocn1OWu/wFNT77vw71fqAbKcx+UHQ9svUMbDA+rADw/
         Tdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787502399; x=1788107199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWA1KGnTO3EbMHd6NugYiHPec1zqdgPzLSeRr8Sduiw=;
        b=ZBeX8D0W0sMhS0RZX6IsoG23hw8ov9FmhtCbdqNJwd0ULOzCh5lAAQSZB97T6YuXqV
         7v94/ysB9X8cjjDlvKA5PlDuMPw0bHAJCCirhxIsv1+suIsG/6V1D92b9s7/vBbA+Piu
         y0APC0yWdqiyxGMULUKbA6hsQG39V1a44BQuA+Pejj5B2c0eNDxf//mG6EbaXJ5BwmjJ
         b71YjPDgRj7P/QkMhiDi73lgJV0a9gARB96eyi0MlAau75sGefToWqATBRp2itf+avLe
         w2D5cGMbn8mC1qJ1gFTyH+hpqrHnVJyzzsCabJUdtG80facZhgILGgq9/statqdwFtjh
         heQA==
X-Forwarded-Encrypted: i=1; AHgh+RoHhb2BLAiI4Jv/AHVRYctYhM/6LKZK2EHj2GeCZ7ckQSgayj0hGU+aAvbrtL/V1bNoc8Kon7U4ig==@lists.linux.dev
X-Gm-Message-State: AFuF++lFwBWli3JCXKR6rpHyW3J030y+6QM2r2OiWgAWAZI7smKpX6db
	ErOb9w7XmoBvMFcCmGkeeDk5Ve/C7WV0Rjrmc3hsoaGRPKU4BzAj8GndxbAm3dWEooGQEydJ/Kg
	x6s93BY9zk1MioDqk6zwMVoXzII2jdVlNF/wRGeWTVw==
X-Gm-Gg: AR+sD111zbef2sRX7u+HtjlVqMDnFPQWX7NET8ThK1XJyFM7CfGYa5yiWLivUmflI07
	M1SzXWiU5sNsOy825YwIXLb8F9S8pGl72m0b14X9+p1LZvoGkE0hjr1OP7ATYo/hml8y+0GJ9M2
	IdioBz4RKZQtubG+QfsLm6/jmDMvgaJg0WUV0qATfzz05Z9c0MBxMg33HSrmPUirbMacG0gOjOV
	rDZoFUCWWI/FUlYUCGfayO/ZrKwzGpdfflw3L+h3NmhE0t2fYHHwR3GL25LSyn1qUDN4Y1024Ys
	TAqqgvWI/EbbGEnHrhR04JQ1PGs/LIbkrBnH7Io15LkH
X-Received: by 2002:a05:6122:d8b:b0:5bf:b497:87c3 with SMTP id
 71dfb90a1353d-5c60d994dbemr5624662e0c.0.1787502398813; Sun, 23 Aug 2026
 09:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260822015448.238214-1-jhubbard@nvidia.com> <20260822015448.238214-9-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-9-jhubbard@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Sun, 23 Aug 2026 12:26:13 -0400
X-Gm-Features: AcwNN1XMFd5gRjeLYzurP4xhhdsffIyF1MWsfkTQiTyMqvpsm5CIEeS5xae5wW8
Message-ID: <CAAgWFh1vEGzyFHDWUpH19VYZVa98siwV3sm2Yf5x5jW2uP+d9g@mail.gmail.com>
Subject: Re: [PATCH v2 08/31] gpu: nova-core: add optional ucodes firmware loading
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 9:58=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
> +        // FILE is a basename relative to the TLV's directory, not an ar=
bitrary firmware path.
> +        if file.is_empty() || matches!(file, "." | "..") || file.contain=
s('/') {
> +            return Err(EINVAL);
> +        }

This isn't a sane way to check if a path includes a directory
component or not. You really want to use path-handling apis, rather
than open-coding this in a way that rejects a few special cases.
