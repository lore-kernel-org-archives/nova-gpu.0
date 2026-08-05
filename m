Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AE346E64
	for <nova-gpu@lists.linux.dev>; Wed,  5 Aug 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913365; cv=pass; b=JPV1GtqTf6FAW9ldLU9/TyYsS55y0PlCR2DOw0ys5t+Hc5myVL58bCqNCZQmGtKAJxabEWEfk/sNgUT+zAmc6DZULKX3LZD6KDtfNoRSY6fpyIm2OVPW7DIozKzzmORr0ML2AXT5Ro6761lfCNdLKy9fX2H8PXJqjFzaTSWCobc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913365; c=relaxed/simple;
	bh=X9DLVvJ8kZ3o/aKGNrmT4crMmKXXqJyZuyKxDrdOtyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFlZcBBrLnqLx0ZZQR6fLE1GnHgKFFYTeEvUcXieQgJugxx3zmZ6H6yQJO6HTqXhIERnqGMTMqsB6bI6NP9Dr6AoY5s+sRNp6KGWa9ivXOrNWksJ4Tf8mCai9PN0lIQ10S29760z9ZsB5JAG/ndY7fywl6sWorXyC+qgVoWUosM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIhWKI2d; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIhWKI2d"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66825847b2cso705551d50.3
        for <nova-gpu@lists.linux.dev>; Wed, 05 Aug 2026 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913363; cv=none;
        d=google.com; s=arc-20260327;
        b=K5gOtKlSx8LnwcQsaINPtFt68Rf/vT9r3Wcvrk7P01YQeEaid9bTR5p7eHnLjeM/Br
         /dZcTncGEmmCdpRs6q1cZ8b8zim5H6fwdKciYDO+7Gh+lZOxoibjW01KKau/aykjWkV6
         2Cr2vuJ8s/hSP6CutfKwCsjNmYAfnCZiWsyVVyYp2Fz1BtajkHJaDdXZM3q+Ki6OIj/v
         JIlJPeBU/no6DFr2ckEYOldfuPOtLk7qQPFMOVK0ysy7UcUJznNDrR0FIwU6a01Ak2qN
         JZFy5RKhtP2KG3cpsz2FgfixkJRPcCDDVi94+nspPHbW5zKjwSi0xZfmiFjcxHmgoD8r
         kf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        fh=eoQ2vPX5clicd8lmRqayve4m6/My3VGbRt1sSBn3O0E=;
        b=UvI5ou/Nv6MjExf47apI/uncRnIFproIWW4DACWHtAAfc34OCE4RfEMh03isIM0R84
         O587r+rcm5csYVlOlX3HrOpppjFNqcDDVlulRTNqed1aXoHuoZZMRt6jOY4mfJ8x951W
         YErRZ1aT1iNcQHn/Khi9Swhai8rGX/rTsVaogP0r7/J4z8atGQ+XYnyHO9fFFpW23Pwg
         2h4FEZpFI8USM0WiShB/7h2LEpn8sIr03DhNiDVLQMcVGTc/1DjmXAn/sVKDx8gQQ8kt
         geCYO/cvQQ5cFmhPItD4TLpqe21QRB1qbA9Jbf7hjGYpsxEmNX2Yir92m8zf7inooWuc
         tR1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913363; x=1786518163; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=hIhWKI2dqw/WMACw8aHPKgfR+Dybli98uYxG8Oush5MXHRTUxGSnUXNMIZKp6GJb3V
         +mpOTrGmiI5H6hBa1/nROn2PumyJp8/5kaVPoh9FjEVjbfcXLZ9CkBQvTbb2NiFeZHIA
         iOaPfotBmR4mUwVUo8uZZEIe2+LnXJg0JkXx5I0Rwb0frNgyRZzGQckXXkd7x+TrMntL
         1YBcvetWgpSoQjEybwKs3g1qwcIbdVPm9MqWZKu3rHwUZ2BEJcpVGvV3Ra+2UujgdaW+
         sj6C4f/SLaq5sqOzrFZ+i0bRc4omHclferj8fAEWfe0QPUrBmpRoVp4KdBliwsw8bk+y
         X5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913363; x=1786518163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=ixbDrlBeunjAWlhy/uY75T333+2Xu2B6noJtliaoIIQHvbETTtomAT9vCGBnrDhg0z
         iigPXbb4oYOxFvgEdOZnLh/yNb7fiKto4rZQadnwENJQCbNvGHOzaMrIlsTxeuyJw63s
         2wiyzPtATacJQFPOvM1Sfi31slcLWcEfPkZjv4Lus127fMkmcyVLUVmcUiqc6In1Jt8V
         kqVZfWhAi3MFxUsmK7NqmSiEDfmocN48ZzvVT8+jugf7X8r46EAUfVCKaShjLOYwSaEv
         qWWo7gEZRjFpY1BIRCzOMTzttPUT5K8ZX93T2cMxhaBAQC51DbOnHGZ/5eMlgRtSlsNs
         axEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+3Gt98FDUgU8J8UTxjEyWcYZN3ppQEcCG4n8qxGqeRA0Uxwf7qE/b5gC9tSeCZNl9KVhcCWTyyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw62h/NkRPC2yrzpP4ww/ivl8UKoMrtVFHyo01BRqqnhshXMCc9
	9HkNPrsUihE38cZRSlBiv8fxyK9kb2MUJIewPl9tlGzSlm7eKMtc/+BhyY7p4qNjmV5SQzrCnaV
	UzrEtk+CKWEacO3BzB0C6xZ3gvHA3/Uo=
X-Gm-Gg: AR+sD11RBjlx2XaRNVX9iPkGL9U/v0O+DYQ/Aol2wtpUAXZ/ZFshO9jTyFuSsXIqr3B
	KkGqma0B+Ioywmg+77Xp/12CMzBlunXMWgSPskA45vtKMMS9CNGtrTGQyhUEBVReetihz+LifCx
	X61rSnfA2JgNOFWnBjl/glAS06UaMyiOjYjpMLn+2IajoUQKouh/K3UFgkxvshb5FDlK0oC08aj
	/shVt5hzPDDNmz5u8vyoZDNMNWGQQxzcLtXyGYRTktRTsuuNblkAprbXfo3GqE3qXEa1CcvQn5f
	JHm7A+ma0YLY7uCn6I2ugBEUNqf/RdxYQ8HVnZS73ZUT
X-Received: by 2002:a05:690e:11ca:b0:664:dbfc:e454 with SMTP id
 956f58d0204a3-6699a892fe6mr2574216d50.3.1785913362887; Wed, 05 Aug 2026
 00:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com> <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
In-Reply-To: <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
From: Ethan Plant <plant.ethan@gmail.com>
Date: Wed, 5 Aug 2026 00:02:31 -0700
X-Gm-Features: AUfX_mwzehL-ePDmTswSjyc9hlF-NtAAFmKSmV6DsLAB8oAWcLbYIszSPAFss0U
Message-ID: <CA+ZM=sFFWx-yCWaWsUk0usONc7BMh3xckFxZj5tQx70SXtao+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpu: nova-core: falcon: remove unnecessary check
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The `try_with_base` call performed on `NV_PFALCON_FALCON_DMATRFBASE1`
> already returns `EOVERFLOW` if the address is too large for the
> register, making this check redundant.
>
> -        // The DMATRFBASE/1 register pair only supports a 49-bit address=
.
> -        if dma_start > DmaMask::new::<49>().value() {
> -            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dm=
a_start);
> -            return Err(ERANGE);
> -        }

This also changes the error returned for an address that does not fit
from `ERANGE` to `EOVERFLOW`, and drops the `dev_err!` diagnostic.

Is that change intentional? If so, would it be worth
mentioning that in the commit message?

Thanks,
Ethan
