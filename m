Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6A3BB69E
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998086; cv=pass; b=WBminzIx0tSrp6PtfPeWHezn0WF2JSc7yZhII2c74+w397IrMKIcrTcZS25z0zaOsUdPYPRZGkyXCW3IiuPZBs/3kHetDBActPd0mbaUzKxPHwG0NG0mE6y6pQemLF+8Pq3O0PlLiZZHAswPAVfmQh24+4ZhI+CW+q3BSjWIHWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998086; c=relaxed/simple;
	bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2Ga85cs/iMBNA2RGm7NiNQPASN316IWnLxiJF8KmtzJrJBjjuA/Zyn7T/20VUdxr3jPn7bR91zAv0umFx+qZZvuIezxDW/kCxIacBminNhRBas3NDrdXMjvIrqL0t/fg5qfFmrnnLxhlHYoVrYCl6jHam/zqnVP1t1Y9jwRNtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSBan5Et; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSBan5Et"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383cb94f742so4744240a91.3
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 13:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786998084; cv=none;
        d=google.com; s=arc-20260327;
        b=n/Jhc/FJCzilURCeZHEG4hQhQYbwHWPwAHW7qg7i8aMzjJjanh7ez9WKvUcn66oJ8k
         +mjatGcLRCpDKBq1q3Q9yW65CLCEcY1n9lHH/Ke1KtapOd3Z3E05EL8HRVRQkBlIkBVx
         cnMe+7vz67Yacn1HRnasbhnooR4hla1eLKJfy0dz8y9TS3EdcEWlHfT16n8iNupZYhD9
         qCK1mHJDJc8oiPxcaHVY85qTl0d9dC0td4z4DdG7PY++A+4hu0L0/CwX5QrlPDAqSc95
         9KapWbKBnzW9gv8Llh27rD6N3OmM2Ya6pfWDM8dLUIgY3Fkmds+pzIYB46pvhvqTgvDm
         f1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        fh=d2Jytq9m3FmM/jRa+4cn1c2Row0ksqQnqOF3f3GOieU=;
        b=YwxvJFQsQpFaDBbWRn74vgm2EN56L6ZCU+DTkBQopj8MalsJC3E9mpwkkZYucFLKm2
         Vd0/Jv2QTgPQfOrbjmlLHFa+X1RxBivhkcMQb3Zy/ZwdlRlmontZSt56up0coEuWtWnq
         prF1y4dVlyYdEqJVJG0SBFlqgc7MMy0YdfKPEqLAcIpnaCQSNzGIM55DWRxunTjxwbpF
         vWaNBJlRegFMgqIp/lQ6DRvGmYl7jauLjZBQSc1eGDf1DSmPYXhPkkijG902Kj1Iww+X
         NKFkKl0+dOkPpn34q0wasoOm3K2vNjuJaSS6mG8JZTp374oEDzTWnq1hy/9Ewdg3IVp8
         jvSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786998084; x=1787602884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        b=mSBan5EtbrL6WCLO9xTvCtaCM57kpPpH0/S1q18ux29hh8x+nzVCrmUQvPA2bEjv9b
         vlwhocWH1mNPUaLCTavr/f4PjMrJ/BcrCsOEpLdnXweXFv5mWuX/d8BPeww0tLw+Vgwu
         CUV/204iPOHXNoiWzso5ZNQQ5jRUL1i4xy5WHmPO8MnzjKBb2Zu9bwsGaAXsMGBdvsth
         Xr4IZFJJwn/Yh9VDmUnMvQgeVPssUnspAniZ5DvuA3K7beni1Tx0VviHrBo6xzk0/AXy
         g0FaVb5bfOZcBQBoNhV5/2UzmDmPJE4QkdnqyFpHGAuLH1nsdt9YPHbUks9Ry5VMK3Yq
         2Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786998084; x=1787602884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwvuQfJxe+jzb1AKqFkeSinncTSpOJtuzhCaTM05Xok=;
        b=SfWGUQ0g6YEmsZlEuXp5trSv8ZI0Myasl1OqZxDvO0KL6TAqFk9vvbA2J5xVvWC0Tm
         mwO6HiJpd5d6r0x3I1oSKbGbC9D7mxRmuGdK6B9Nz9HsHLnwMiRcvJ97QS+1yeGCOr9G
         sgwz0wsipYNBwDtY6wac//7TumQ692eG4G7OUlELWwiQiUN+b6r413wxbe+C8UrdcvJo
         0bLueZmN3+ZDzTpK0Xbl/2OqHTp1SVHE0ydnK3IcpWlpf2bfjvSe0+ql3bXzAmCcn4FJ
         jceN2vE5zabFhOKHb94P/1eU0b+IbI4M4qGAsD7LkgmTon/oEcgXaRST9rBTO1GYa9/D
         Lc3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAW0DiJpvl6DYsKQnx2XZL4aHQl+d4IFfUmpfieZQ7DWg6cz/7kcxXf7nQgPwrfCovj4QW+Taj6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOD7rl9ytDaCYzxum9QrH7+R5kvuvb7QyWU9Oez6s2OMBACLb5
	hIOlF2Q+c8uYjeNQcTVdPyKx3L1mJq9EkzXwDdp+jZ3HFPZuuA+irymRul0iW/73VhnBkT8yGyl
	aKhvBWCbZk/9oO0zlLAOXLEg19FE+aDE=
X-Gm-Gg: AR+sD11KZ8OK7uW8fXI0gb4K0Ij2hOe4SP4574qmAt0bxPSXw8tNFZalTDDufGXanYc
	HyNBSxoVKoCfSy3QVwbAg5qH7BuJ2/BARi95SZ5sdjPtEoc7TnHt028d6mVGa0D8qxWwguJ2OpP
	peYJHffL2Ydy8Kc2j/jciOF6kg++kMa4/t2Etg6X7Vj/w3ZYx5gXWNKaJAhl3XubfFo8jqvTLF6
	SSNzidcZ9vXQ31oa2/+TAQUpvEQ95Fi7PL/3TTyutRXa6kF57uKtbQW9Xkd9IxRCvkkPBxJKhE/
	khyBnyibo9GL2fdg6D+HuCZFy/T3Fy2WFWpxWyEagZaBx3iwHc1ZlLpNpotO9b1ap68Gl1IIRlb
	wxkzI2ymm2RnrCJ+MVj5GomuBRf/1Tg==
X-Received: by 2002:a05:6a20:748a:b0:3c3:a9e1:a819 with SMTP id
 adf61e73a8af0-3cc71fb5781mr30510652637.24.1786998084370; Mon, 17 Aug 2026
 13:21:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-7-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-7-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:21:12 +0200
X-Gm-Features: AcwNN1Uf6g_nlw9gnlPOPGW_J12VrUV1D6JYzwR-ziAxwEvca2A9VHgurt9Kvbc
Message-ID: <CABwQupP+YAvDQkszHWZ13GNPer0j8XSDL3j7Eo1Q233Vd1vW4Q@mail.gmail.com>
Subject: Re: [PATCH v7 07/10] rust: id_pool: add contiguous ID reservation
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add `IdPool::reserve_ids` which allocates a contiguous range with the
> given offset, count, and alignment.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
