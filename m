Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364E400DFC
	for <nova-gpu@lists.linux.dev>; Wed,  8 Jul 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506873; cv=pass; b=M08aspySjoJPBeIQQEItMozgXBE8hsCViJ9WlXrokHuJXDro1S/+hvfoiw9r9Y7uBniPxRpwNbz2lDrBLrgcT0lNt1tDgKUUdvAQCE5SFJE3OqZuebZpUb5tBJT7oKaKs0DBkkwvPJUE5xiTE6pZzff2IsnDwKUybGnnzf5RN6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506873; c=relaxed/simple;
	bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFCedJeROXZdqG6FUEyjyOH6MuPCS3YbSiF1UAEFhYGnExRQFKA8GRsoJ3fj/A5IId1kLNLMlwV6sKZ21Me0hvdnrnD3QkG0Hx2eKSSze7JHT3Zph1WBtdF1LejIZaaab0XVUVfXeXfVroO7wrKpWiSEEd2UqViCbUgvi96HFgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOSWIQCg; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOSWIQCg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-380f3c1b087so59861a91.3
        for <nova-gpu@lists.linux.dev>; Wed, 08 Jul 2026 03:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783506860; cv=none;
        d=google.com; s=arc-20260327;
        b=EEPxS8NfSbJcy/k+0ZsuXdwUGwxaWtGCPVz8DbOW0Onb+o6tfeKsR6eYFoVm/5DZn4
         fzeM2HcSOa1lfU+NPzZkrII+a7MZnZvcJgT2pfdgGwp+PMZdloVrpUaWqjj8Tt8gJo6E
         MoQfKhW/Yk1kPFD5skjgX9AHN/XB0/11FXAe8AFKReeAKX+JNwpUvN5RTNHhupRPQc+/
         S56Uva/hOF1KhgheYS9ltr12KE0G7bKiePbiE0aTBuywPST4exlFAwFawOSrzzjSdkHQ
         gAIm14sxWlvQ2OQN+XWeaJx0vhWgToUjuApzMBNm+J1untQEjNuS6lhVONqHRRTuwPJs
         aPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        fh=5tDZgSO2ar7byemFPBhkDXq2WcmvMZ9rQ9iGgEKjYBQ=;
        b=qO1X7Dw9yBQELPCFHdr2KRXZMpqfnSbDewNEo0zZo2OIGsHlc96yIwrP8ZVkieoXvd
         y5e8V12vc6HpMV3KgU4bQfbMHwLFgo3AL/c9lpLFvjkcRNSdMqTgpKUe2PcFd8aK2h5s
         GpPM3/qziuBC+mCEWkmiIsioMypqQALY9GIz11dINHgXP/tAWyIRQI/hf0NmkHQEUuQ3
         ER2slip8VrG2qA1Gd6exJPXa5tSmCEkZb00eYUfD5bb8agoGQTJwcUfz65OCf7AtGEhS
         dbzKlc7f+MpmTp7roE2/Aw/Fw0j6rTYbtyXoFqIjupTdEcchOK7xLNXCE81KhAXyBFlM
         uiBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506860; x=1784111660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=YOSWIQCg6TbGaFlULdSPHglwG1OxMzyrj5vx8go8Pn+guEv+DY89hr2gCiPvafaS0l
         rjfcQ6JJ+bOpLClQFPbPsQ95OII5RvjiN3mVGZw5d+M7hIe/hhx57325CRI8Q/lmNDjd
         xeupKVd4+B06aSqRP9s4KfCCAUoiHUPuHQqY8i1FZkHY5Hu3co/Lt7aSgIrRY+23ctsx
         PCov0I+BcmkQcGgV1JGbjzwg2AOE4iQX/sddD3kYbAPjOEVAdd2yLZ4OAQAz0vFNfam0
         zlQClnWFayfLqYNsDduky3GueHN0tokU8RNa6/Guz1L/CunzEE0x0a1U9cKN6bqgPuyT
         yPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506860; x=1784111660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=pMnzWvLhg6DDalbYrEabot7b4ZSzHWKuk3MZ0fIXua6CxOpGzZTVrA3DSNT4jKOMB7
         Sv0mAdjNFi8WXZHbPud5mt1wWMnr+ILEJRxEY0b/BZepLZDHJtf7KN7dvLsbAjFYh/6g
         ZLk6Jc4iQRIm+Ej18inl+P+37+Gv2DEPlwYNt/2bHnZ0TNPLFheYCjEyRBzvYugHPpQM
         78mg1q3Mo5zN0kJSZEuj7efP9lAbnnGUKptMUq+uioDpSmf85rZwED73SD07RfSE4cpK
         zUZLiIL8EuEI3TDzy+3BLfG6N0JErzH0qo5b2PU8SsanbMoj8+wn6rzXk+q48W7D6TDa
         dxkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrar1moSeyR7OQyX0UhYE8Yu6NSRCPl6Dj66Rnvg1iRBZGB4v9YW2zXSDewo7v9PPl9XMP5o1bmPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX+rZZSdkxJnGDz3w8AuqWKQgkDxqji/nxiiMA9S3Jz3UlcoVV
	CLPV0WdhyhjpZkwI/90A4HRuSclpDKUZmcTiza9X6/5H7MakbS0foOuhc5IUk6B8BdNulI+ZJJA
	fvuiAbCoDxq+DTO3Y2758/PpmTA8k11k=
X-Gm-Gg: AfdE7clqhALpoYh4pIv8WuqC7iI8cR4b6g3I8WA8/1OvpeJlzM38rjbezxJJ5iWcl4v
	hlZjUAhoix3v0UEe5MUONp3ZDbFlVknz8Q3NlBBYlf6Ak3QEHeIEte4iORu9Pb5yDQda9bT5bsl
	0tifgHEo/RWjBceXPgcoOAeSzoMxqMGmNKddBOauYDWov9EQilsrJGfDpHj+9sJratbfF4GqZtr
	NUrqpRE/GvkHz3TM5++b/h61p1TG/z+Jgpxe8qvv5S1TQIjW1eJqZQ9adl0l7HPk5mx0/yc56eP
	5sBhBCNWyGCBhi8JRqwpeu+7MX937vBZGh3EhevUx8rcxZ5RnHUDsQkHQnzA/Yh8Gq+XLgE4w9a
	BK3g5M+b35+r0
X-Received: by 2002:a17:90b:57cd:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-389417e436cmr1662657a91.4.1783506859636; Wed, 08 Jul 2026
 03:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-1-72cd5d055d54@garyguo.net> <9AC77170-279D-4C0A-89F7-8D07F418AADF@collabora.com>
 <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
In-Reply-To: <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:34:06 +0200
X-Gm-Features: AVVi8CerPf3D12GiMfvLd9xxakdPl4vxt6Mk91TDYQmPEW-zWuPFQaL-PCqilw4
Message-ID: <CANiq72=8V967CuH92AJBAob6YaygXtCYY1GAr=qGuF8JzQfZ3A@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 10:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It does, but if the alignment is 8 then it breaks a lot of platform devic=
es. 4
> is the most common alignment needed so it is chosen. Different base types=
 can be
> added subsequently when needs arise.

Maybe a two-line comment/doc would be worth it?

Cheers,
Miguel
