Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3B42E41A
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661182; cv=none; b=MTV4Xgl5TFndI1WUqCN3wF2ijpi1xwnAkpNAy/+ndC9tRmCferh57QeITq5tI+g6oXNx28hkTAvL3eJtup323/uibw6qp4SQnj/wWUCNSJ0HcnbH9LQNoIEJyT6za4v4Uyj10jA+fp76gg8EGPA8x2pJhV4kpnJioKa7G0u/OBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661182; c=relaxed/simple;
	bh=vJt6tZj/OG/c4NLOEbG5p6WQuIEd4cW7vphgWLCDr5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VyJD/3rUFiT4jQdsY0IF4TimwPXHAFl/2QQkGKUfcppFGzkzjTqILylB2L3VtHYgvA++3tY0OWPrZQRTXo+G7GQDA38q01YpuS/XHRpM5FJj225emL6J0nqpOVxr1pT4M+cI0hi1xkRBAYlTzrGOl84m6Ndkr6rS6wIBTLLZ42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i42GiNAa; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i42GiNAa"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f81362fb1so2807212f8f.1
        for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787661179; x=1788265979; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xlb7XfoBk1nmP2689qZHRSaAXYmnb0joWXGBYKuH+kY=;
        b=i42GiNAapQd7xirjgiCCzjR3ShNe0WvTE3oGMLqAdfKCO8/t/qOpa3ltw53YQvk/+9
         T8Xet+gWD+HILTcKy4brLEb8/t5zwlJIMg6BVgSS3hwPv5bgbTvdPNNVPZM4S6j/T4pX
         TrDaPiWd+JGbExNM/iaynjIlvJ6To8evq+hx3mVhqs6HTHCXvuh8aj91d2c2mKabac6j
         mkrvXe4quCfxEIbI82EtR5lbzE17JsH4k5u+ICT9Xn4F+ACe1eNYetuT4UumoFNuR8nG
         2qP7m7XLYl8R+JhZoT2hSP8XluX+Zvji+P8eMskDfjJRz9I3BaI27Zz4bfJ6RQjZtuUx
         7hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661179; x=1788265979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xlb7XfoBk1nmP2689qZHRSaAXYmnb0joWXGBYKuH+kY=;
        b=hsXHLtKnfz/YQv/ozcy712dyiKkwXrqRgH3HRq5V4uN9/CSblalbKO+CLkyC7l0yDP
         k2vAA5an6KoJbRrADHW/WxAKQ4O609jFJcQb5+K/bjP1pD70CQMjeh7JcbN0LnSiaUlz
         DikXtLU4fAi9Hl78AKQqQ/8IKlmJBiFxMfquxcmV3l09HN9GF8w0VRPWssAnjQ3N93Rc
         B7EZo+oKNVUwZ0oDHaYiU92zHSYY/hj7pzB9VyZiGlG5rgvnlFogbJSPRZRk8scY+KCo
         I4LqlGAM7wZylr5Lo/6vRAM5YRI4tHATN5o3NCORich3iL63t0Dly3jRgsdcrP9b+YT7
         YBxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ihB+5TbtAlHjzILF2H+PWW3AaILFE5TKtDHEMKQPddDV+1BNVQ1d/6GgxMEX7EGszTScjWAp2g==@lists.linux.dev
X-Gm-Message-State: AFuF++kmdIBTr4HvxTH7fyXv8v+3mjeiLgdxqPthkKZcPEpvNuwJ4dNg
	Eij/1Tta+LQpPc5AjZ731sVbBCovfPoO3cvyQyS2BmFt4U7mtWPU9D+8ckxq9C4ZalfsKq/TCBi
	bvLjCzeMvrET8CBpqsg==
X-Received: from wroy3.prod.google.com ([2002:adf:f143:0:b0:47f:51bf:11c1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5846:0:b0:481:5dea:3f0d with SMTP id ffacd0b85a97d-482c0b8eaabmr42274248f8f.11.1787661178297;
 Tue, 25 Aug 2026 05:32:58 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:32:57 +0000
In-Reply-To: <20260812-b4-rust-pci-edu-driver-v3-3-5d0b5594e52b@mailbox.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812-b4-rust-pci-edu-driver-v3-0-5d0b5594e52b@mailbox.org> <20260812-b4-rust-pci-edu-driver-v3-3-5d0b5594e52b@mailbox.org>
Message-ID: <ao2Lef62ZvkP9eWI@google.com>
Subject: Re: [PATCH v3 3/5] rust: pci: make Vendor::from_raw() public
From: Alice Ryhl <aliceryhl@google.com>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 12, 2026 at 09:52:37PM +0200, Maurice Hieronymus wrote:
> `Vendor::from_raw()` is currently `pub(super)`, so a Vendor can only be
> obtained through the named constants generated from the
> `PCI_VENDOR_ID_*` defines in `<linux/pci_ids.h>`. A driver therefore
> cannot match a device whose vendor ID has no symbolic name.
> 
> Such devices exist. QEMU's "edu" educational device and the legacy
> qemu/Bochs stdvga both use vendor ID 0x1234, which is not registered in
> `pci_ids.h`. Per the policy stated at the top of that header, IDs are
> only added there when shared between multiple drivers; a single-driver
> ID is expected to be open-coded in the driver instead. C drivers already
> do this -- see `drivers/gpu/drm/tiny/bochs.c`, which matches with a bare
> ".vendor = 0x1234".

IMO we should just add Qemu to the list. No reason to hard-code it per
driver for this case.

Alice
