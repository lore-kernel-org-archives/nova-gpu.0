Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533060;
	b=mGp7nNQLQvgyd7IobG0G/C7XVHLdKaAZHHTLh9PWJXfZeaxubCJe/0EFNElvxzeARiQK
	 9LoWozodvueIjdQxL2MyAPa02Jh6jUjbD7owxoAVYCKtp9e0Bi7m80rQtVU/UFMYSf1JB
	 z3JTTi4mfbxxuYuEYR84N8f1eTphFMwuHPdSj+EyXnBPJj5A+1pIFOtjWi21wX7OrkZdf
	 nyA5b7vXFD7eEtwFgd1VViuxM5QgSF/ZG8L2vL4KJ8fW6d8VFUJiSSenuszEb8hdsClEY
	 MmxLSO8Pm35WQajS47SOk5QSt/t1MM4w602jWH5GCCpaXBrUPJNibzH9ncT+WbjOgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533060;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=VYneTTXCjtmbOlbjA+MpKhipMzV/P86BWbzDfmqFm6o=;
	b=seZ8NkjmrKlPkuOLll7snpw9F44y8j2d6gq79gk8FLUt3UdkkF4/fxcMly55ZN4TJpNh
	 +LsxIvmrj8rkPR90oBZmIPU2uSNExBDGVKbESc6kECw4y7bCdFNnkRytviXdw95YZH7kk
	 zDO0GmvOB9AaVuV/9S1IJ156dLqG2xSnyxr429wnh2CwjXhtUvYwD1ERlZBuarmPTbSGI
	 yUMXZtbODrHnQpYa4tO4AGarHGtI5d2jyiMMGUJgBdTqf8r1/JE17hPCQvbfnSPbz6nqc
	 OPInas1oknNvGWd5d2XmZ7kZocG1tzu1vcQmAveHaXX1lWBm7tJSSxFdculM92dzPkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqsxDtP9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26B606A321
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 01:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F26B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqsxDtP9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794533058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYneTTXCjtmbOlbjA+MpKhipMzV/P86BWbzDfmqFm6o=;
	b=OqsxDtP9VQnS8iG4FvnwXRLglR4QOkgSj4jvyobzCKFK3MzkGvbgvXRYNvZskzRzHB7V1W
	dujIuIVQzYpTLPjKmZUvGfG+4a10rnGqxY1AiPGqapkJLJejhwie9xIIGR43Aa3evcy/so
	IDy+/fsq568QujFFFR73U4DheZ/0nQ8=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-6JjzJaH-MHCsIeYro1mSAg-1; Thu, 12 Nov 2026 20:24:17 -0500
X-MC-Unique: 6JjzJaH-MHCsIeYro1mSAg-1
X-Mimecast-MFC-AGG-ID: 6JjzJaH-MHCsIeYro1mSAg_1794533056
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so519889eec.0
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 17:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533056; x=1795137856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYneTTXCjtmbOlbjA+MpKhipMzV/P86BWbzDfmqFm6o=;
        b=RTff0HhQ3anBnrSm90EdgcQZeezWr1KMkshZ8Ns6pbveL6YYDPaZYM7QRrI/xQiw6A
         JbO7BmpZzni+AwurFyraYtunmeuLA5R3RNUM82mAfnEW7VrlGUUYgw718QzjnKWgI7nq
         WBCmTpXaQxbgMstaIhLce/h0Fn5T9aW1zVJ+HjOQQ6Plrba/ODK3OE9wRwdc3ME52kQf
         wbIAnVwjRHiaaBFOMvmekRVsfhfpG5W4Xd+6xdRD2PHmAfDiIx8z2MDgJG6zartHeENe
         sNhF4NZqANruSwRc2uf8LTQ7iWHBNMgj7gIK/ySY1d6uPbHeNET3hcVn5vLYV/yS33Zm
         pp4g==
X-Forwarded-Encrypted: i=1; AL+hErEbxaRykK4HTkoeZ282njON6wkAO0RQE7Ok4zrRLtm+JvpTcTV9/YFGA4w/+NVx5u4Q9M6k5E5FOg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+w2HAAm9hKgmkR1MGhrX2Td0zf6V+hs4mEj3doDFGZemqN+4V3
	oEv2cIhx7qZdVG0rC7/wIcvxHzp6libqJOgUGaM1TfB3DuxD4Wtje5u6Cj3WdSl6lT0yGKhwOhd
	Wap+3LIftV0MMCA6DLg6jVa4yASu17fckh+8W9ZfM6hvBkC3CDjeXvFXTME9YUIjNIZAl+melQu
	iNsNErI9BDOOTnKK2JMDoSpVAT6L6oueq1eZg=
X-Gm-Gg: AYBFou1DNdVMJAnIcVJgvNgi0s5j2M0OjkLfBig8ePuRtzSxh/xxhlrcGSGRkuQTvNw
	51rMWhl1uNEHjLw1OLxfaksx1/sQ9W1m2WodIHQCLPLOtArojH03tN666imzes5H7IrSE7B+nC4
	t+s8mbeLcpXYyyjIhG72T/3HedF9uNImVlOTUZdm//qnhjjKMsVGAef5SU5bVO01vdggYANgEi2
	Q+tJi/Kjs5r6dPQ
X-Received: by 2002:a05:7022:f909:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b50313d943mr1020545c88.39.1794533055653;
        Thu, 12 Nov 2026 17:24:15 -0800 (PST)
X-Received: by 2002:a05:7022:f909:b0:1b0:20:6444 with SMTP id
 a92af1059eb24-1b50313d943mr1020523c88.39.1794533054920; Thu, 12 Nov 2026
 17:24:14 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-nova-timer-v7-0-3031c2476551@redhat.com>
 <20261111-nova-timer-v7-2-3031c2476551@redhat.com> <DMT9NWCA0XW1.936X5AXCNUE3@nvidia.com>
In-Reply-To: <DMT9NWCA0XW1.936X5AXCNUE3@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 13 Nov 2026 11:24:01 +1000
X-Gm-Features: AclHuK9rsswqzMyBRxjIm2gfwoldtH6M87AlEIZfwdKaC_-fdnm9ONrfhZkTVY4
Message-ID: <CAMwc25p3pENjrMvbYe=DMB+Nre44_Gx26h5LpTrCEJE3DujVjQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] gpu: nova-core: add support for GPU timer block. (v7)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PJW8mWWjX76yKUUJEbvE7sz7GJQ2eZQ28n7TKenmGjg_1794533056
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> On Wed Nov 11, 2026 at 2:23 PM JST, Dave Airlie via B4 Relay wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This is needed to calculate the system timer offset that is passed
> > to GSP init.
> >
> > 2 HALs exist:
> >
> > a) tu102 is the gv100 path from open-gpu, the priv level is checked
> > and the cpu time is written to the gpu timer. no offset is used.
> >
> > b) gh100 is for hopper+
> > This is the gh100 path from open-gpu, where the secure system
> > timer is read, the offset is calculated.
> > The offset is written to hw offset registers, except on the
> > original gh100 where a workaround is needed for older FSP versions.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> One last nit (which can be addressed upon applying) below.

Thanks, fixed the nit and pushed to drm-rust-next.

Dave.

