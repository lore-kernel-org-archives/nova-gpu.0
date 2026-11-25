Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795581868;
	b=mz48TzY0tOIxusp6bmkw5aXLEQB6hnAE/mJq7rsfQHevvQDff2QTy3FArTTWMLUZF1gO
	 H737kAmfP1YJm2ZQzHEmUT3eEmKMvKPdV/cVFv//4oVzi3wyV2/RieP+xX0+1UVIDCB09
	 7POeL8mO53PFdnbsUwmgjWVmmP8PCZkblRN1CPoULd/quG8hr3L0Ozr/NugfaJ0cLfwVg
	 fl/Nyp2nMg1ZZj7+0kd6977gzjVBDURYZ0bjMXQ2obic7YguPmlDQwdsJswXOwA4e1tqQ
	 Y/cof50zMmg0iltGYALdHF17eE4iphFPfyrQGkTJw6RwwrpotVWIoVJkgfDUsFm+hcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
	b=JKLKzmQnzYAeKrjA4/WpheU5Rd32pdF8lbA2HDCv7d6qYpEcNvEr2nJTliFUBwBqUe/7
	 f0JJiTXvx0A0oyxZiHaIpTH4AgWJJBhDPO+fl7y9CO0hAt5a9BtRfgZMy4+ruvADHj2fw
	 ko+E3O6xizanqvpjPzsvXZ6qYapMMrmsOiO/caNvGpb2oVZOEPQUXkGjEap6394qGExp5
	 UU65vbf7aKxKWIvjTOUYYpVkto5OOeuKz+I40TtUftcEEK6G4iOJ4y1nwN4Vp+EmtseVa
	 kquf4EJZOKfyOXx1spfgyCGSxstPEfrv+IP7GcMscXKsLcH5jqzwdAZzxiPF/Y3Z6CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=darkrefraction.com;
	spf=none smtp.mailfrom=darkrefraction.com;
	dkim=pass header.d=darkrefraction-com.20260707.gappssmtp.com header.i=@darkrefraction-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OvYjiIC7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A50606A31E
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 04:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=darkrefraction-com.20260707.gappssmtp.com header.i=@darkrefraction-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OvYjiIC7
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso7245332a12.2
        for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 20:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795581866; cv=none;
        d=google.com; s=arc-20260327;
        b=OMrSq6suBUAvwBdRGo4cTrQjUOI6tsFiTRen7lAXXhOSgRKrmH4Lyd7+SG391Dgscl
         4oVlQXRnM39Tn8E6zI6Pm3voYbEQ0CKtbyFU4SfhYFKf04H7D3Oi1rPy16CHDQ8GvyGW
         8zS0sOulwhF/cmO8iuI9uHUTCkZj9c5snLIcgisHCp0kDzRcrAfO2BoYqzORJ9LskIYx
         dFW3UpqDFjXehj/7oKT1RTWu6iPYNW/poCeeq/evxSJVTvI+QO0MW7OUGUGOYHtEK+u4
         LGqwag7N9faF1N+lXvoiP0o+qLVxJHsHTr3GR+/OI8Ij3ofVRFumY8bkoHx7ZiWfRqXR
         ePHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        fh=VmV+VSh6bYV/fAAEqbKDgyJlnUvhf5ml3R+YmGHcCPs=;
        b=J265o1juheXt7Hw3j07dPiYXOi/L4se/asPlYKko5Fs8bJHvF6TPE75XkEZug16WGH
         8Av/KWJfm0TpPlajGn4d5YKIC9P+0kOz411Audw4SftmqTDrf2FuGfZCGvV8l0uU+r2h
         c3AHQY8a/3i/CptbO27y2u3Qx46Tnfc21oaonlq4/atPaYbcNjFYdky4cQdUervPe14t
         g7TcpY/zYBmL88KGaGxTihFlkxdTm+4MDOVNGQfFRls01940Bz04dx61PMu+N15zPHnY
         ggguH0EAkR8T3Bhm6YwgkhJbD4cJJEFwaI2XgZSy9RTdzN76sJUvWxNCuDEvL5gABQJx
         eZTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20260707.gappssmtp.com; s=20260707; t=1795581866; x=1796186666; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        b=OvYjiIC7zl+dYj7Ccx00ZC7wZ9Pd4/qmsC/CTIgwkO8Oyex08kQW7jVukXyxKaH5kl
         mGWKKtuJjlrRgzmm/sQuAKagBPFg2/IZs9jcR6wLrILfxw3LWwKVO30NLOqk4C8iFfDo
         XQJZnZAqwo0+VQdivKyAmqXBzO7Il5hvcgFHim8yl4bQcuZiGvF8GLmdYf0LfbggWPBA
         VDKQluSCFwETF9dCOOV9NAluOW6EoxEhOZccg2z9o3CwQ1dEjjoHHsO9nva/4w7n8pgt
         UzrD0YTDi3MeDWXr87CADVy/jhXfZRSJsY/M71NE8HOXuvlqFCWPM7XCVa2H51N79nVH
         A0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581866; x=1796186666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0P/Usw7+gp/Bpo4trnNxkJUQwTAy5fHr0Bs9XaW/gFE=;
        b=1LT3BTrIJ4UxFqqohbj6MZfiYcPhnBN++K2krpQUFKGYzCfO+0s4QWKG1bEFeUlsEW
         il41VNUbVcNcIlqqRd+xcCnmtbZwTvIeqg0+C8Xs0gh2Q8EAXl3kK/gJKEvGsN5h5R2F
         O1PxDRa5kaQ90z8qiZG366Ud+U8bc4fM0ZEbYkFNW1fw0DAzLfqaY1Kcjemsi0GwSqZO
         GdfQ80fxX8qFWvMSAWw/6C++O6RdWxLAx3HhTE2d+eHMFutxUo3dnPofrloUwH+8uQC5
         xn899Yd//uLU6RxxrxElB6jkbgEHeDI8WSkiPHIOu0jRSQiqC7I9SiJ0MEVjKOAY2vjY
         BRPw==
X-Forwarded-Encrypted: i=1; AL+hErH9H7kD4Exp66FAmxDWtY7x6Ydxi5pRsXHa/kewmbjp8n7Z1c8Z9LpT8IEIUzkm8ogIt/AK4NEeZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GBmxy1L+iCNN5tVO/iVnS8GnNilH9RqQdmDGpmLeOrWdycjCz
	q0DBHP5kpToH/4pgr4yJdXBr5RX4CrcJ+Shb+Cqagqm/iNixfEqdTUbp6jI2q3p46wRT0flmtTQ
	iRwdQFqNozGYWR3G7CAzPGPugr0SettP4eH3VQFMdww==
X-Gm-Gg: AZFdTZeeqPxVFmijUwy4HytBLj8j4w7z2IPjG4NdHYzlXOFl2GKnbKom+5pkDxfIT1y
	L20AiK1NpD8KQJdS9jeCCdUwztfvyn4Ut1N1Fi9pDpZdmqPFzKUqwotgmquFpYtOpgxQQJpnCee
	eB+/dsydxtSKzPyJF5Vsk7Ajt286zOIqDejq1SiI6amdCTqUOvEMaErS7o4kxKK6Gbs8W0ysY3a
	vKwfdJo9EKulXqHv25qkpN2qMf2b9iLy0HxTCohXeVVbd+59yFUNHSXIGyGaiOvrBY28BinEIyM
	F3HENZC4gZNpwV13LPy8RVTEDOu1cm/TWra4fjh1p9oIiVJwjR6W7NMjSRSkeh0D7gW9y5FAC+Y
	nExGaXE4WMQVNtpkUpBq1YYy+bOIy60bUblQ9qFg8kZ/37J+X40/34t7ODi967+UAEVg=
X-Received: by 2002:a05:6402:e8a:b0:6ba:dd2:7660 with SMTP id
 4fb4d7f45d1cf-6ba37ea54e2mr12212519a12.32.1795581865793; Tue, 24 Nov 2026
 20:44:25 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com> <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-1-e1440479ded6@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 24 Nov 2026 23:43:59 -0500
X-Gm-Features: Aa3M54oS8z1bbZenOaASI7fGSdwFLpJbJd4Pid-wIEEd4ioU315GAzjwqnmrfoA
Message-ID: <CAAgWFh2VmmZfdEM1hDB+8921ktfRrD81kXFqEc6dJ3ys+=vJYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
To: airlied@redhat.com
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 12:50=E2=80=AFAM Dave Airlie via B4 Relay
<devnull+airlied.redhat.com@kernel.org> wrote:
> +config DRM_NOUVEAU_BIND_GSP
> +       bool "Make nouveau the default driver for GSP-capable GPUs"
> +       depends on DRM_NOUVEAU
> +       default y
> +       help
> +         Make nouveau bind to all NVIDIA GPUs by default, as it always
> +         has.
> +
> +         If another NVIDIA driver, such as nova-core, should claim the
> +         GSP-capable (Turing and later) GPUs instead, say N here; nouvea=
u
> +         then leaves those GPUs alone and continues to bind to pre-Turin=
g
> +         GPUs itself. nouveau can also be prevented from binding to
> +         GSP-capable GPUs at boot with nouveau.bind_gsp=3D0 on the kerne=
l
> +         command line.
> +
> +         If unsure, say Y.

Maybe the documentation should make this option sound a little
scarier? Right now all this does is break nouveau (unless you're a
nova developer),. We really don't want users or distros turning it on.
