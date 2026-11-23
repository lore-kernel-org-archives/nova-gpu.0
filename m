Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468302;
	b=UNY/jiBMsKIzAa9FqbQmrek62fcfLrTT3nMdd7KP99upSFrxwvzROrnZ+rSaGs0UCt/1
	 9t2/FcTqYP5UL55gDawc0/KoFVlmK8yXmS8C4OGXl7nlZW39rCovT6XHex/Rz50oTVKaZ
	 V81BN8wjBN/90y8FLrBqhigpwLZEStd4SRoFEu9C4wHXTL0SSpG7NC9n93r2iTTL1IX4K
	 bM39AdmawnxXiMPXzh1XdVjIobSl9w96sYazL4c9pVEwEDoo/veGOYYYKYhQoKaw02x24
	 sl4PInl7xsfr9His0fgClLKZQDh48mqrs1ATjoe+VsdvsTr/PAs7TaZjfYC1QoYpR9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468302;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
	b=RFNQ/UVZdayPPBU6IlEvkFG9KZZx5rHUxGwEuWQ/2fTCyu4rIOkf4c8fWlpHtIP5DPWi
	 F5LZmugx7F4rwpAXiSvZTfvaNd5ItwUm4ESnMkSaoGL1O7+gb4x4iZT8j72cLIMQ5+jha
	 0aFoO4731roQoTd5oGD5MSoYSnEmSgdJFCy6TFZmFnCIfxk3/BUJkqR2BQO6qx5lJx40M
	 GXWPnj69Q5NCOeORoKj6hpDPm4TtPvg0xMirgVcnFH4egiBaAhwrfMLW/b6bS1zVx/BHe
	 VgNm4P6lHAIzi3B4SqaupmS3gMlV8txjqdwpVZTaMVt6djqg4ZaNKek4yg3R99wVL4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Qf/RRXJJ";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECD606A31E
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 21:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BECD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qf/RRXJJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795468301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
	b=Qf/RRXJJ+xiJdWH5jZ+FsA+TP5tr13wrBonP6ZtVdUAivNqLsh2O4yCnueHKVx4nfVb6ov
	SjpYmWfxt3KURj/+IPvawZ2iHF+sWH793IUC1T+bG+v9wZNx4Q9IbzhVsebEm2Af79Ao4Z
	qP0M381oKc2YeSXnE6oNWx1+ht2mHUY=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-lKozhtAfNxW8uSGyT1F5sQ-1; Mon, 23 Nov 2026 21:11:38 +0000
X-MC-Unique: lKozhtAfNxW8uSGyT1F5sQ-1
X-Mimecast-MFC-AGG-ID: lKozhtAfNxW8uSGyT1F5sQ_1795468298
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b56c696405so1888411c88.1
        for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 13:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468297; x=1796073097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
        b=FZ1uyc/chtSmkZTvB8tUvvTcJ7Gz+bEN6zf0VWbV6jUY8AMCkTq5RqA+TwUCQlCeMl
         8RiRU9vMLd5rz9ZJfVRtBX3AVRZpACJ03qMfr4aJzcU38uWbnkCObXYsFFqo3S4zPhRC
         pDFzQ85WC/wg1Wf08jKu1yoLHRqsYKfBEr7B3yDhUsiEUXZJk2Jx9EqLN1XCds4tZmuJ
         xGPZvy9JLq1G6Dl3aZHJhrw89EVcXMqPzAT55uwaA+Hj47UlewEqrJHjSN1nKTDraB7e
         b/WbpcU39PaPus3pdgRxsvdnFDEAJMPaQxLR6LRyuPdEAPHlbvPK+H1LrD/gzRi5aeR1
         JyGA==
X-Forwarded-Encrypted: i=1; AL+hErGAZ8puBN/EkmFpejZkUjJYvcGHpS2seR+HtxkT+FYTy3hyCveFq967NhxTtssjr4BtLT/b3hwInw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9HE+aOfTi0ZO8ZYCHDKSaLosQTNtUWdKmI0RFofUMLBulJmEdT
	e2nB0mjGOiCQqusM7HxnAjO7HozKZ2/IUudMV7cB76zM4QX6CbR14C9vSfQuTpb+CMs0x9KYedv
	MUZuIHnd7rZPtW6uiwdiY8MuyBlz6BYaeZXt+Ay3ksAaUuLTPwp4x0S8l/sMa1zwrRi6Xl/bwvx
	QM+Y0774HmgGvSBmKSPx5NyT9wNwV/rFE3MoQ=
X-Gm-Gg: AZFdTZcWeSLwc5uxQVWnW+Umq66qmNCUthkDO9QgtUVXt67Dn3zUfQmGmQoGLB/NFNL
	lCsuUZpUxXhkh4K79qZ/8cMLNpwzavjggd12OrijZnJrIDBjiNmOiGtqsybzW8/wN079WkADy8c
	iYNQDacw7e86R/55nYMwIHZny5Oo+aRxlVU2YNY7qxhCRBlOfftbeT/ayB+cB/HQO7AH+qClq5W
	L7V/zCvOUTB7F/u
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr13460405c88.41.1795468297273;
        Mon, 23 Nov 2026 13:11:37 -0800 (PST)
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id
 a92af1059eb24-1b556926cfbmr13460369c88.41.1795468296661; Mon, 23 Nov 2026
 13:11:36 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com> <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
In-Reply-To: <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 24 Nov 2026 07:11:23 +1000
X-Gm-Features: Aa3M54p6fvlOZnXQWzVJ7rxsais-R4gxmnSrBvqgceCPwlHjYyde1II3OXoWZMs
Message-ID: <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
To: Timur Tabi <ttabi@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "lyude@redhat.com" <lyude@redhat.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5wpqvLMxZA0dk422VQXDFL-vM40npdCQc_yN--WUAkI_1795468298
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:34=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> On Mon, 2026-11-23 at 12:50 +1000, Dave Airlie via B4 Relay wrote:
> > Distributions that want nova-core to be the default driver for
> > GSP-capable GPUs can set CONFIG_DRM_NOUVEAU_BIND_GSP=3Dn; the
> > nouveau.bind_gsp=3D0 kernel command line parameter switches it at boot
> > time.
>
> Just FYI, we've already had to scold two distros for blindly enabling "CO=
NFIG_NOVA_CORE",
> despite all the warnings, because "that's just what we do".
>
> So personally, I'm not a fan of CONFIG_DRM_NOUVEAU_BIND_GSP.  I would pre=
fer just the command-
> line parameter.

At some point we need to give the option, but indeed we don't have to
right now, if nova developers are fine with always providing the
command line option then we could drop the bind options for now,

but I know it can be annoying for devs.

Also distro will enable new things with no warnings to not do so, but
I wonder should we do a default y option of NOT binding nova for
allyesconfig.

Dave.

