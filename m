Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087078;
	b=lFc9M4N9GwLnFroVU0orpfqQBlKN5tN48kq7Fg7yXc7P8mSdF3qDCibYcRKmIcbcPyIq
	 TjULh1xbvKKETO3Dcc+Wxt1z877A+wB/VliCPpV0Q8H31vRn95Or0Dbd03V5nTd+0D8/W
	 uoU8UAw9AylJn353F+KWgBYkFfssEVfzZSaTspMwOPgoErxzedqUHh26we9bqBqaGU4jF
	 LCqSEfHFqxhXCDnNPaIu1zMt2i7Y7/uP84LovmAmkqw9Mtjl+EZ7BTYXthglN7k8SpQca
	 Gifts3zt11m4UJV6xm6/hrnF/Tiuq/37tI60i1C6i9z+XU+Jx+/Vjl2CDA5KafvFfDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
	b=nXkTfBm3MDnRNyuuY6IGUntOSdk2r8FOLzRhR0Ph6mF8qPsCOs20UuOPs/WIYFQoamTd
	 zp/MhXJ6oOOKVnyBGwx/bMjFpZlLdluYRu654M1ndhcG/QRdRX24388P2vVZqxEu3KYfO
	 WcUpbEuoD9dljOq5L/B7N1LDjTs09zTzv4huVnXLxgqv+OlqHBaOdCYmeBvNQFLf8gEzw
	 S3Py5sQaKcYkTYWTMkmY7OsJt2SXmGvK1J50GdgjxzwcCkvNTLSjDx6qlzUyLs2Uitbe9
	 +KYeJUGbs23h0WA8DeZV35YB099eDyGHsrjDNYdWPMtmcVnp3SJM+KX2faB5mNZFsaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KDt5/uQ5";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE88606A326
	for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE88606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KDt5/uQ5
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so1606558f8f.1
        for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087076; x=1795691876; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=KDt5/uQ53aP0e6kt81712zmMS6gYtM7xD+1dQj5qiSnQPHoXkI7znAUJRkDj7XjwtK
         BuRo2qJIJeNIMhEdcaA4QKgJz8OJQD/0jAs05xIuzl1qN7eD4Jp+g76sSymSQMil2Bef
         hDhY42DWmBYREMrV1dRXIr27BmEKhFr59qe2jaCk2szlK7zpDiCF3qGqQ3ccg1oE6kWL
         saLdDzicOFKfPqMtHuoZmerTXMC6J68OMQ+tJ2u8qQ5uYdasha5hOvIa6EbMbZ1cihhl
         b7r+cGol1opkEFVE5pmC6BNy+vbzlebTQhmvK5kOzqyTFFQ6Zl4j76wGtKl7+xsQkrvP
         2uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087076; x=1795691876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=wm0fqa9t6/unbQGgv7UH5PL1wKAJUUG/IIs5UT077fPp5UzD5bmVBN7pFpJA3sy5KC
         6+CpOzOGIZnV4+CIxskfkfLob0LACpu319KRv99i8CpGVcbg21Ph1GN3gaWZ37u3OV06
         QXJ0VQPVAW/C7LY1qQ3HnIJ/snTI8UyAQ5KVVx8TskWIgFeNWFmo4PTcTQN1evQdcy4c
         v3Mu2HNqk+8ncR9OFCxmGoZ/IuH3fwajfqukiNJFyccFJTqGOEca9MklWpSsWdY1Wp/B
         FHXPSmODgyoCMwDQtUkcBlVPvxllSpItQIL2s5SOc3T3n1FCMeOzR7SydUnX+Lq7TuNK
         JxGQ==
X-Forwarded-Encrypted: i=1; AL+hErHF96c71L95XBiCb5L7Wl4BYqhjVgshqlHFvc2D06/llL0duxI7KGXl5ZIVCiN+nCf/9oz7hKtWBA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hZymSmt1dFTP44wf6J02LlE+iiQDzWxgl3J/jnM8XQaezdBv9
	jSIwpDKXmBmGD6Fg9/QtXaUMLtPcaIiIMTFKYkH7Cur7AxZgJudeNUT2rTxw+m3/6iKyEqIXRkF
	ojBBjFPXA3u7V6dXH4A==
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:4b2:3c81:ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr116377775e9.0.1795087075740;
 Thu, 19 Nov 2026 03:17:55 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:54 +0000
In-Reply-To: <20261118163203.2483856-8-dakr@kernel.org>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118163203.2483856-1-dakr@kernel.org> <20261118163203.2483856-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111754.3049805-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 05:29:48PM +0100, Danilo Krummrich wrote:

The v3 updates look good to me, thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
