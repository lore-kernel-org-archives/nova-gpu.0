Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899D3DC4B6
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719996; cv=none; b=nDv9oUEf6Ed6Sc/CdznG3yFkfeaI1gOmpKjMECMv9EuXs4XVMk/G9TEP97jeml43YYhkiu02lKUkfjZ6XrmNoKIEhdS+9Kq4G1HzoOxSAEiUkboSOFetRKie2IIoV2idl2XqgFa6j49ylOpLVpLyTTNWW1Ms2xJrGI+FZuuEnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719996; c=relaxed/simple;
	bh=Fjh6McgL6DD/8o9fAgQe2P5kMAp4EdOgL+d2WCEdkpw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=NUREUNUvy/+P7WpF7jk5qTF5pW8agVq20136K3L5ImVhxy253s3iCOIFZZTs9hRjsSJI5/SKON0A25PxCmXWdh+AOeVAvEyo/ConIIZMHNtDKoyPE3R6TZUAj1li5LGj/JpvITPwtug6SPRD/TpOg1Ms1uF3C+XjqiWdGcQNAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNYXr7cN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNYXr7cN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7c61b5292so25484835ad.0
        for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782719993; x=1783324793; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rezmMRoW0TY1v4PkJTz+2piz1eElRyv9KkMLuNl5nCA=;
        b=RNYXr7cNXgo5QRDc31rlRD7Y7SySMFjCqdodK8zkQORvfiQJbNYQiiI9H+TS2qdTbq
         UGHBvkKUGnr0BgBv87vFSwMUy60HkkoyAL3SZob/S0+qXTtOqCZ4PtL11/kl694urg3u
         SYbOntRwUCCpd/OoSQBahX7FJtp20CBhh2r0qGyvuk3O5rWrz6BUjoqcFOibbXjTDZLN
         Im9zjG0GPtEFIXQvYB8NWJkVK14cYyDB/i0bo2aWp14NLAW53n4dngDzRcxLjvEvRFcF
         RKzhzJoyE+IO+yji1VtnO1iLSK78MWR+ghbM1q5/OX9FGM0+p4d4JWz+iQndgVfw0IUq
         bfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719993; x=1783324793;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rezmMRoW0TY1v4PkJTz+2piz1eElRyv9KkMLuNl5nCA=;
        b=rqcMtkuVA3QYIdntSD/8UuxKWXBk6g0cr8NgK2WXncJ6YRKYGa/IiUVKROSUuhqc3U
         P+Wfq0vJtgLt6WET2GNFQknbwdy5JjuhL+DpHgzWuC2cmT8fOlpTolkE70BRTnD55iUb
         rxqLGT+b0ciiX1+h7184GTowTh4dTri/0kllNWp8eVkpJMZ9ij2v0ovEOdwSWPedRwRu
         dUIRTYdSOdyDQ6pbbaEEYOBzv69qWm2FsHJa+rRK8lPYC35LP2PkVOEiqkAGsMyYZt0U
         9uEJwl1K+BadXTiadew8DYXLDfxYl4nS0ObkaQfEUCdJMPJ6uoAHCwCVyg8o2ZhUt+tE
         dxtg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx3eLI6FMNPnmIk4QkA0PA883kr6vuV9slTN9iR1r/1FNhxtmTA+rnZ0SDG2CMCIZfh1YQvYydhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqLJUreDG10+/a/5W0qegAOxtQnW5D/x1dmUWejy7gcTV6q0po
	roEBF/9VNFh6DjBHIANhwYv0fvck6lNgp+nvnRUmBO/eWrUL8PFIVusr
X-Gm-Gg: AfdE7cm3ClGDzH0U3dyThtP90Qh+D2bPL+DnVDuoyBnWKTy6eATy6bSf4o8nQj1ehYp
	gH0Fx2V8Zvp9ZubW7qKsnpPT1/Bh1/0KWAGxdluU+1GVInXOuevAKbcWg2pUZ8zrMpr4ZTKEbjN
	VUY5Xi+CFLygq38TPKu+C/NnmVCCFBD61PdB0UpHhvd8j/JDeCuowXy0jKgsgBvxEhtxtg1jyct
	toCX1W6wQptpllNyclFMvBayssa7/vS58a8rQNinIPBGvxPewQfMShlN2C6a9nnS4LabH29dGnV
	lCb7OZ1+yh8jUat761brOkCc8gK89NEk85ZLtcR/9EKNDYw7Mmq/auTEfc4p/ZVrt3M6n+DMc9P
	FGzt2vvbAYYS8Rf73iJY/s4S/h38pk4GNjtenfrp2jrWAC21ktISpodg+51vBFry/CKKO6cyDfl
	Xjz+0e57jed/2+GCcIu/n0GYtcpZTakspnveSY1DVZCYZEyg5C8pJJeG3kK2oOnH2his9O+AdA/
	2J1nilMNNdcrsLvmq9PO5ZrGqskTQIfMZn4WO88
X-Received: by 2002:a17:903:2443:b0:2c9:ceb9:865b with SMTP id d9443c01a7336-2c9ceb989a7mr46743485ad.21.1782719993052;
        Mon, 29 Jun 2026 00:59:53 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9cd6916e3sm32503885ad.40.2026.06.29.00.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 07:59:48 +0000
Message-Id: <DJLDHST0Y4ML.68M47LW7EDG4@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha"
 <engineer.jjhama@gmail.com>
Cc: <sashiko-reviews@lists.linux.dev>, <ojeda@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy
 via the transmute bridge
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com>
 <20260628172200.B116D1F000E9@smtp.kernel.org>
 <20260628182154.712621-1-engineer.jjhama@gmail.com>
 <DJLCGEB0ZTL7.3C1BGJRHW35HC@nvidia.com>
In-Reply-To: <DJLCGEB0ZTL7.3C1BGJRHW35HC@nvidia.com>

On Mon Jun 29, 2026 at 4:10 PM JST, Alexandre Courbot wrote:
> On Mon Jun 29, 2026 at 3:21 AM JST, SeungJong Ha wrote:
>> On Sun Jun 28, 2026 at 5:22 PM UTC, Sashiko AI review wrote:
>>> This isn't a bug introduced by this patch, but could this coherent shar=
ed
>>> memory lead to a time-of-check to time-of-use vulnerability?
>>>
>>> The driver validates lengths and checksums by reading fields like lengt=
h
>>> from GspMsgElement, which is mapped directly into shared memory. For
>>> instance, in wait_for_msg():
>>>
>>> wait_for_msg()
>>>     let (header, slice_1) =3D GspMsgElement::from_bytes_prefix(slice_1)=
.ok_or(EIO)?;
>>>
>>> However, receive_msg() seems to re-read the header fields directly from
>>> shared memory to advance the ring buffer pointer:
>>>
>>> receive_msg()
>>>     self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
>>>         message.header.length().div_ceil(GSP_PAGE_SIZE),
>>>     )?);
>>>
>>> Can a compromised hardware component modify the message length concurre=
ntly
>>> after the initial validation but before pointer advancement, potentiall=
y
>>> corrupting the host read pointer?
>>>
>>> Similarly, send_single_command() initializes a message header in shared
>>> memory and then reads its element_count to advance the write pointer:
>>>
>>> send_single_command()
>>>     let elem_count =3D dst.header.element_count();
>>>     self.seq +=3D 1;
>>>     self.gsp_mem.advance_cpu_write_ptr(elem_count);
>>>
>>> Does this allow the device to race and corrupt the host write pointer b=
y
>>> modifying element_count before it is read back?
>>
>> This is pre-existing and not changed by this patch: it only makes
>> explicit (via a checked `zerocopy` derive) what the previous `unsafe
>> impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
>> layout is byte-identical and the message-handling path is untouched -- s=
o
>> it neither introduces nor addresses this. I'm not familiar enough with
>> the GSP threat model to judge whether the TOCTOU is in scope here; if it
>> is worth noting, I can add a TODO comment near the affected reads.
>
> So I understand that this as a copy-pasted Claude/Sashiko block, but
> would also appreciate if the human behind the keyboard could provide the
> context required to easily understand which part of the code this is
> about.

Sorry, that reply was an unedited block. Here is the concrete context.

It is the message-queue read path in gsp/cmdq.rs (wait_for_msg() /
receive_msg() / send_single_command()).
I haven't touched that logic; this patch only swaps the unsafe transmute
impls for a checked zerocopy derive. If it's worth noting, I'm happy to add
a comment near those reads.

Thanks,
SeungJong

