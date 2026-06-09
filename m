Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1533EF673
	for <nova-gpu@lists.linux.dev>; Tue,  9 Jun 2026 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002004; cv=pass; b=SKkDCqRjYS9Hw7H+gyzdaKETCGujz1nVkVBW926siWrbjL5xJ9IVyBtNX+a20nqVzxLyjTreAKvpFEV1MV6OFGd3SvBQ6YT/tFgVsGhjBCNrg1AtaUhuZzPM5AayF9HQO92kHyBjnWqYHjggk064qDxbjYXNRM4CKXgV5iIsQBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002004; c=relaxed/simple;
	bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaf0wHqovPAzZqTEL/4fpsPKrt1nskPDqZFJn3k7w0uCRLBaTKkWpbT9+DxmxOhmZ6ppzmBMuqTo15JPry31WGTzFAbqNlAIjbDu2zf+WhkoI3F0jTrDr96mSTMpejkEB64rs1EK1ms+rvuEifjHwXeTm9FXeDW5H9qX4xnPKN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBY5Oagm; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBY5Oagm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304e86ecebfso328995eec.0
        for <nova-gpu@lists.linux.dev>; Tue, 09 Jun 2026 03:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002002; cv=none;
        d=google.com; s=arc-20240605;
        b=dvzi8lO5STnyDBvGky7NMFJoroATevqimVLshbX7ER6Hy69se0xQSz/ZY8eIRo4ec6
         ocuKn/lflUkB2DdwrjFHFpoDBEeEIoV2YFG8jLQdz6qCGs6HsRYhXghDSmeCMl/O4oyU
         VN+GNwPfKvV484N3q6KCfwcVwI4ZR89a1vq+4/7MbF6IoRTxTdilYkNw912D+FTQkgVa
         O5oIosW0XCTr17SaPKI9mjPKG2ZdZVvzkeKIIVjDC8Krev4MGz32KJv41xUi99m5k4Q3
         9f0OX9PSHfW8tHCmMzJXP1hbSf8AECrm/nSxeHFsYsStcb/nwB5dNTjffDCbTL51jYMx
         dNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        fh=PO7NaQll5rf7A8cbHAg2AqEijEtKYCxN99pFwP5MeAs=;
        b=TneptmA4urhivoy/6717hoSCQa9hofXNS4+Z482SL65jtCF2gsyhSqW/qDDaxWVUxd
         DczFjzwZJIc1SX98zV3IETCZmhD3iZtpl2lqEuWZwkuRxb4mSkr7lAieuRrwLOOSKJr0
         1vr8IoYC5+dlcMfBIFy5BOWfkmcEJJYrDN5vknU+8iOGHT+Z8NYoDK/a7K+R3R3vRSBp
         DkV9NCwVAzZhgZH67YO1o9QRDY75vw92cdX/iMrJAxlBJnGOIiXOa7Gppm+H9LsvV/lD
         LV3uTlqQMGXchKCtcU55Sb4fEcgWcr30BxmLbhbH/FaFbfXQzO2jLUAVBxsGqF5VKJbD
         RJWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002002; x=1781606802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=YBY5Oagmlr7ZCwzZl9Iukfq1FGkTyNaZuAlijtxkbNO9IC4ADvFU8iNoY3c2Ua/WKn
         2eDIi8R6TygcMETjkAHd5RboNFqAtOlFf4MLQwx+2THl8Ls61JED5JK4zuC9ni1bvHzU
         WzfBK/ukhmoiQ5FB3721T5DxZRtn+gT/vYn2eRWN0b0GLGENz3viPl860xrXPBa8B5Wo
         Ambz2/IR05ekle0G/VGvhhXBzqJn7aNMbtSY8+3+YYe+OkwSHurrTj2X1kFkbZwjejuk
         6j/lN3ewdIwjXmsi72XAwsdid0xDAM0VUV6xx9vqQqy56Goxqjr/3ONXXkEpdxwgRL7N
         5Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002002; x=1781606802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cu2Kue8JGdzYQh52hcHKldi3QvOVFh2giqHCrt+XPLU=;
        b=ThejqOToH6FEZtHYBXl0YctGQquQoh2XwZ2HSkbgZRKA5dAsWkQTQcV0WK5QuGQ4A4
         AJuoOFF98jSvD3LJpECzYSSJ0wzc0ZZBgTWEPMJikQhgLf+lRKqRnbmq96DeObCYrUsE
         6lNOHZxkj0hnlldfJu7sOi6/2pi5tWFCUjLN7jz2MTlY7tAn2x9WC3WhOGf/PMovVJoY
         gqzoAqdOKiUV8vM/x42GFFKRB3zyWPWVMgDBWB5ADdBPtuWGSc3/m8kB02ujw+iTRG02
         I9KXmBQ/VkSUzkSiXZp3LlreKfx0O9fgxzc4u/BbFUkgD0igl3RNJ7kgmpyAXcIkTmiT
         Bt5A==
X-Forwarded-Encrypted: i=1; AFNElJ9e6L3Yr9lr9a9ERK3VPYl251z7X8wO889lWv+yRYCVJJEYH3HDinRsOAZYZmO1kQsDFRMLjvmIcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpbjK/cJsPg3T3W1m+jiFifGIEC6DbcWkGnOmaRWbokAmD+u3M
	oeV0wd1pKycBilW6wIXtsY/oYBLVrvXnJEHH84MfVohrec2Z3nrpckPP9IQYD6P3Zca+c0dMCcz
	23tdZZ8NXjQbJtsYn8A699f+3qj5bT90=
X-Gm-Gg: Acq92OFE8znT2+4s/19ho6Qgm4Q5PwVBWzKB9jFzXT/O8lv7JBndeFDAkPjlJTgXyTx
	1q22tnqTV0WnvnKp6P/Ik3U7VfAVsZNC5h59+V3sRrjcobGY4U7yDas0pfHbTHsDARc0lxK2z9M
	B6Uunkh4QPSS2uicfH0u7fPdZew7MOjFtpI2lW2LmpeVjPe55JHHjr34Q9VUsOmoJFqgX0qd6G7
	E5VD5ImPrjzpwx2rDXhDv2tNM0o/DVl0OOiweXfirWkkWVMPuq77k6anNou94snzEpcOIgUEWrB
	XVa+XH5CTUpxYxxJedeFI2SFchVzNUE1O2cjSe0MjrVxOknoTZJnTRZ52r12BffVB4rbCbgMc6V
	0QGfu25ctyacOWBwWvi7tzu5XjviSR2QwRQ==
X-Received: by 2002:a05:693c:25c1:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-307d5fed73fmr773935eec.3.1781002002406; Tue, 09 Jun 2026
 03:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com> <aibq0WVkvey9C4_W@yury>
In-Reply-To: <aibq0WVkvey9C4_W@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 12:46:30 +0200
X-Gm-Features: AVVi8CcWK268E6b32_9RGqxCdLYA5s3NWf2-go00cNlkmk7E_5xxbpCtVF0SRiA
Message-ID: <CANiq72k_Ge=AgwqNTi8w3CoSX4s6TTbJMe9X0x6MCYXep2oKCw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:16=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Thanks for the work!
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

Given you are the `R:` and it was just a day in next, I decided to
rebase to add the tag.

Thanks for taking a look!

Cheers,
Miguel
