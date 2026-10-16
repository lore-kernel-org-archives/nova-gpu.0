Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20D4D09F1
	for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158886; cv=none; b=Th4Eh5WOojr4tRUYhG0ChSDoq6ThMne5NFMyP8FpXhjAVZBhUbBmcxo78L4cLevNFVhM0xzycR2amCTBtusnMv0yU3Bk3tm1wt+ZF273mZGZ3Ucj3cNV5UManMIP5vFNMHe908FyYzJ1imqi09b1HsXWUN/zzCJ579xvWVrIb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158886; c=relaxed/simple;
	bh=yC1TM1aBiAR4TfDk+QbdmRUAzel//L0Cezzj31VLyYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n1/Rk5KFBLCNwP71IknjJybnpvQAhnEOIHLt4Ls5qeDD8wVSyRTs33kaLpi2KWr+7mL8cBF9PAxCXL5vXilMH+QybeIpEiGJNodY5JJaHYYZbcTSm3AVTqtIP/797kRAe4zu9gAyq3p0+BDcleaJfc+kname90T3Dw8NukyFSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AhniEKRJ; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AhniEKRJ"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so44139735e9.1
        for <nova-gpu@lists.linux.dev>; Fri, 16 Oct 2026 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158883; x=1792763683; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1zW8ObmJUqyJoTK7Wl6HPlLn7nz+xpXE4cGz+lwfMk=;
        b=AhniEKRJ8makfYDUGfQY91mnH9JthpkbCebYX5OW9FqzKNKlulgTQhPZGRhvxPJx1l
         oHHMHMGHh8oO4bCKBxi6mfEiFws4IV76INWMe9mF3TF+XXoJpcJwMkuA+jJ9OVLnKapg
         t7lTYsw+l4t2XHrU8dIA0A34NfKwMi8jt9urHrSb9Bl56SlG2rM516rasOi5EBXIvbj/
         eC/UdQ+PPnBVcIc0M9EWh0Zs3TFb5IeIU7++YKvCJSuENGqC0GUKPQEnYSSowzB5mClG
         Ps6JjMpp/gFEQptCakLtHoA0q3yllvfCJIctmhZYaFafEeJBnoQk5pR2Mge1Cibt2JPt
         Kukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158883; x=1792763683;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1zW8ObmJUqyJoTK7Wl6HPlLn7nz+xpXE4cGz+lwfMk=;
        b=CJzwEWQ0rSHsA1KVJyjeIACj5LeBncm/dJNraFQMM3KYlJ+7VlxqFkBM4EYrTmj4++
         zR9YTxXtvS4qWSUyzHuAnxTHyFNKAwH++h18tr78AqjstdrCub35ImcQzctosbZb3TeR
         SnJOkefvMDNjW/K0rCK9cHIWkUsZh/JrdbUxj4ip1b6SbNfSWrvCzDUQTM56u9qRzWQs
         9dEnr+T/i+SFnaTvqhk/DfVhLS90T1s4XuUqNo4zXrg5+pT5hbhKxX+UW6UHdemhJ6pn
         g0mkZt/2+elZ3r/zw+d758Q9ixvM1Edxcvhqc4z2JMfQUKIOqK/Lcv+4s02MXDG66/5C
         Lz8w==
X-Forwarded-Encrypted: i=1; AKwUvBwESov4YrWpbI6286c9lPeCqFs8yovPBtyFG8PzVnGRTp249r3J6XFtxr5a2Zuvj9le8177vAnsbQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsAfiwP5GCRweECDTs9rCbB2e2gDTcBE08RUDiZRP+cZlxLyjZ
	Eeip6r72OzA/I9bIrNcjoqTl3SZb5TjnmSb20rXzJqSOMxjAc8KgU51pDKTe66tIvBguyDt2LLM
	i+AoIrR4C4XHHW+a3bg==
X-Received: from wrwq7.prod.google.com ([2002:a5d:5747:0:b0:48c:7482:b673])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8216:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a18e4b0465mr464383285e9.20.1792158883019;
 Fri, 16 Oct 2026 06:54:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:35 +0000
In-Reply-To: <20260814230923.1292966-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-3-aliceryhl@google.com>
Subject: Re: [PATCH 3/7] rust: drm: move file_operations from gem to device
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:01AM +0200, Danilo Krummrich wrote:
> Move the file_operations definition from drm::gem::create_fops() into
> UnregisteredDevice in drm::device. This is the file_operations of the
> DRM minor device, set through the drm_driver struct. It is not specific
> to GEM.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
