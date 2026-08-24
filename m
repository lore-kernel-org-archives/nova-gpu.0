Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDA2DAFA9
	for <nova-gpu@lists.linux.dev>; Mon, 24 Aug 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583005; cv=pass; b=D/07FsDHpFOTCOP38Hco98gY6s0OUH3pXnLjC0AYIsVcwKPj1gWIfdoc8PTzAkdJ65k2S0chWTGXU0HkuewK/CMt9nHpmYQX3SeIZLKvp2LizCG+qkun/Vb639/Qz6cC4hXlCegscImRDo73FBXY4POAZJpQT14q/MSLGY4rj5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583005; c=relaxed/simple;
	bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ug/iKLtG+1Z1YWUG87CD8BfcOeMm7+q8ES4RgulU/ka5CzMjiCrBAqyebmhkjem8yVF6aF60JwFC4ehKiJxjZHbZRNx2pzfO3SRO58pOlxZ/FKjQLnTFNsYHp6PmJQPlk2kdua/y44VGlG4/SqYBnocuMIgRQrXrh7p0Fi7dPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=lng62yTM; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="lng62yTM"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so3082410e0c.0
        for <nova-gpu@lists.linux.dev>; Mon, 24 Aug 2026 07:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787583002; cv=none;
        d=google.com; s=arc-20260327;
        b=KS5EF1fDGEQt5Fo6c+EI9D3W4kYXC3WeED7RdwA5Z00YPs8OM1i8kHGKemCzYwjhs1
         WumvxxGvGwQZHDJ/2dODbmSWWJqgQRilobzYHN7T76PjP1HBUUzjHq0l8qnuPZ/5oQLw
         MQv5lX2ywEhrJ09q92yARLLxDFsQhikWhs08C6rCZIT7NCdPgCMmH3O1YlFrJrqtbKup
         anx1iXD5MJl60Hr7NLAqyCrK0fCmF1FtU1rWkGrkXcwKh7ZVyuUPNBTJE6LxXznGfp4Y
         K5fJ2wMyjRWMUtFmljB5SmOi2ntYYZIW65JEd1IP4boDz26/M0NRaZVthx5lq6Ex/lZd
         88QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        fh=1IsS2AL4cp+fPlnyZYtVKmKrNjamofxd38UTLjDXbXw=;
        b=eHwE7dTeebdOkJgxphkrzzzvzGCyB8ktAZ9CA0T1sfLHujL28aE5NWl2jU1fFT0vo5
         PrYqPfP347mIEXBleocWzDhTBZuojDdh5OB7ZdIXJfQSpo2XG8JLrNRzPUcbWYsi5zBU
         nIEmTgJhn8RNXiTjZQZRpfkA2OWIQFxmpCGp4XiaF5piNZVIMxqsAZz/vo4dkdxsDMyT
         FZ+iDIsKEM+9c2DaERJIsdKdaRxua5K5tTZJlYciPHO9Tk0E4vesZrVHSoXO6z59WqYt
         Ue9xKuDv3hkU8JIsiVPLjJKgjWpAI6ueP+S6RcjwgOYbJ7VzJtUyfnnQH3lMxNPJILZT
         NGsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1787583002; x=1788187802; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        b=lng62yTM9e4GpUPcunQU810nb21wgaao+ZRDV4fbBMKhN4jej49oRqMc8Vni8D5/wd
         2FCFTZdHoA/Oii83evH8wn4ytxB/00MJPMhJJbIRY/oZi/3JjRwHksEGEwL9VpxtoUfO
         320Qfh+71Y9T+0P4bj6rCJs0fy4Uj4RuqK3/e6uCT9FWI7ZBQYg3vOtOafNNS/5jHouI
         Tt087CVol+saswJmD4Uy7zcccCjN24AVjTwM8kdGoUd2hobRmjOi/tUWG6XxdjQ1UBf8
         AgmLAZSezo+e+SVxHHmBjajvg9SJOfQt8iVFkRi4AAXRLoWJ6cwb7BZuUYiFr5NxrcEn
         6N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583002; x=1788187802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/jnw52bMP72F/qQ2A6RMospuBEdSfYjaMYSZmBMCGU=;
        b=igF+9p6gX9m2W3rG2GER4VCioeUAAsULMtikIWFnKZdeZLnsyNPlkVYXeh2IS8TcOK
         Pl5qrvHV7A3lFkHr3QFOa172nuSXgvrRAR2m5fbVGapZPhjcu34xaynnuzG4YBTOqpOB
         2t+2/ETJAn5ID0Nl3iRkdPDs8uxJt+kK75Tj/T0ho4ILSukUhOdAl8J2wOqlv+rGhu39
         jsvp08Of8ifUD4plTOiRjlicG1NTUA1Vh5WH/b9nLqYjOAiGvuYyl4pmtZc4CzW/2Neg
         hWPbLvEyi6WoOZcVCMgfT414xC1ysYDFaJdAEMOXdckXSLjhAfuDxL/sRwG8r6C9ww+S
         za6A==
X-Gm-Message-State: AFuF++mUDWp4b+Y8ggz4H1cnkfM1VnwduNeX2x2Jz1QKzNg9X2qHllak
	Ka756xaOl2tvs96JGC8NwAkxFAVyuS7K/Wr8UbjJ2Q4XdauBgAm1VzTRwoAHYp9TSNW+CFQE1Er
	YCvjh/EbZP1QNP3sRgvCjuQeXluwjvpsNAgNs4CqrkQ==
X-Gm-Gg: AR+sD11+FTS7hvI2U7vPCivg8aADCP0eL7rNzNpHRmKmfP9cMwqB6Nz3so0aOP2EMzy
	G32AUWeQp4mDRu9NAa4YZKrw6uqPD3RX7SFXB6iw7Zqn5r/rYXLSi9RbDb7gIdvz8qp217iLXHE
	JATinBGvZ0SSmJxqbbt+0xSrFo+rMiDLpZEL/64tnzOwhBZilKR6BSEzJqLOXtbiTs1y7V1tC9m
	59JktjdxA6Ks6mlxQwyW1fh+3JVDwgb9dAt/ixSGzLXhkzK6wEOfxIr3IMOl7Phipn4g/dwBkZT
	qyS3Lqa3WWNsPaqIsTKb3jfF4dgO37/UlgWayessfTvT/g==
X-Received: by 2002:a05:6122:62e8:b0:5c5:a34e:46ec with SMTP id
 71dfb90a1353d-5c60de7fa8dmr8437650e0c.6.1787583002393; Mon, 24 Aug 2026
 07:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811050657.646799-1-apopple@nvidia.com> <20260811050657.646799-4-apopple@nvidia.com>
In-Reply-To: <20260811050657.646799-4-apopple@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 24 Aug 2026 10:49:36 -0400
X-Gm-Features: AcwNN1VXMSHFTOJVp4EEFY1y9qIYBk2kbt8_wfsDcMgOmSc3agHjk6H3Vsvh59c
Message-ID: <CAAgWFh0VvY4D=-Se+bVO1YonRNFEa28nc7+ZbxEbv6en7oPaDw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm: nova: Add chipid enum to nova-drm UAPI
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:12=E2=80=AFAM Alistair Popple <apopple@nvidia.com=
> wrote:
> +/*
> + * Opaque chipids. These may be used to determine what chip a particular=
 GPU is
> + * based on the identifier but the values themselves should not be assum=
ed to
> + * carry any particular meaning.
> + */

You say this is opaque, but the userspace MR you posted already treats
the values as non-opaque in eg. sm_for_chipset.
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43352/diffs?commi=
t_id=3D945a8e7c51939577526974b342c8dc6bafc3372f
So, I guess my question is, is is opaque or not?

I don't see much of a reason to make it opaque since the chipset has
had the same structure on the hardware level for 30 years, so I don't
expect it to change too often. Truly treating this as opaque would
likely require a small refactor on the userspace side without much
value. (I realize this has already been discussed a bit on the
previous version.)
