Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418201;
	b=zIbQC7jj77EoccJJHgXljJlCZ6/dIZbQRG7MsHF/1zkwOVYCn6SmKFrfTErFAb81Sye7
	 B8+coCGd6vuG8KTGlO1aWx5yCTK2nE0hjFGKVRDwj2wbhZwT2OMtgjmodJkrrEeslb3bi
	 aNO3gKFyYE3mTrDzsqQOFxg3iVYv7npyrZH2Q2bLiOokmRucy76A6BExWWGmSYoqKiCcE
	 WZTKoTAp2tjh4fDNSVzLIM/2aU1Xo5rsmJaTSNBzJCBIuUswYfawwe6j32T/R7fZ8E9HH
	 Qe46lPme+Libp80NCCyBhZBTpPumz7HPb30+mR1SQPkZaV4vEqIRIKAtJlW/bdYo6YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418201;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=cw9ukMhNQC6UNqrLwLfCFEs87Wm/7AQehU8HdYmnOMvuvZRww3+L1lOuxxL8uIw3vO3l
	 b0lMjPTj6MHAHk2zfMYrEgmoYmCS+4wn1U6iDLo1GlsveI+C7b5ohmAZd+0S+gNF2ckji
	 GTRYOwWqZnIY337RwkXQcFgaevT5AO3bA5KsUKQNKWNH8FqAIG0Rvvw5xl372oYpEz/p8
	 6BkJ+TTKgbQWiBGoLUnIgzkwe/k7saLFn94RBrBpX5+gtnIENSxQERi/cqdtoGpbZcc2Q
	 gwEJ9TfX2CtUxaFgp4ubt1NrWEEq2jgz8NPrBroY5TvNspviiHKAZejg1b9a2I9x4nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kgAoWqWf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BB0606A88B
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 17:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2BB0606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kgAoWqWf
ARC-Seal: i=1; a=rsa-sha256; t=1794418174; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J1wl3Zvpxev0DGwhYd1mPbQy7eKIy7/VxKt8XZnLehTZD5ZD+8s9X5oTWJJJ2X73LgUREJmHy9kSYJgNNmTTWebUihdpniJt0mVK7ZXY4K04l91DsPcjyR2Zt0zTi7Rlff07euI9BwH7DJe4Egw1nx0U5avM/9ixjMcUSBzOhTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794418174; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=aPoURh4oL3UsQVn7BxBtJ5OadUIbhpnT80S/0BqS0Zf3tB+LCofv8uPUbRocegjFR3rJYu46n2kFiFPJgSvSmW4shgrmRv9qW+GeFx3+Z7kRPQhflMQZEo9ueAYp2+cEGdZcK+ML5/x9T8HlQl5qtuqeHfafbAou4mUu6fIbwok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=kgAoWqWfpIkvKM+aQ4I08A6U5Far+l7wwYDCPLPfV5E29cIzpeXUM1VUnLIJvBXgkug6utdS6SjLsblp9nmTPtnJgHyORuT6Id8Ykic9Gdj2z5h3JgU0s1c1/rQ9RNXuMq1u40mP74wum/+IChJs2WrqpxstJ16C68hYzMv6mCU=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 17944181737439.499080471783259; Wed, 11 Nov 2026 09:29:33 -0800 (PST)
Date: Wed, 11 Nov 2026 14:29:33 -0300
From: Daniel Almeida <daniel.almeida@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "aliceryhl" <aliceryhl@google.com>, "acourbot" <acourbot@nvidia.com>,
	"ojeda" <ojeda@kernel.org>, "boqun" <boqun@kernel.org>,
	"gary" <gary@garyguo.net>, "bjorn3_gh" <bjorn3_gh@protonmail.com>,
	"lossin" <lossin@kernel.org>, "a.hindborg" <a.hindborg@kernel.org>,
	"tmgross" <tmgross@umich.edu>, "tamird" <tamird@kernel.org>,
	"work" <work@onurozkan.dev>, "brauner" <brauner@kernel.org>,
	"lyude" <lyude@redhat.com>, "j" <j@jananu.net>,
	"alvin.sun" <alvin.sun@linux.dev>,
	"deborah.brouwer" <deborah.brouwer@collabora.com>,
	"laura.nao" <laura.nao@collabora.com>,
	"beata.michalska" <beata.michalska@arm.com>,
	"nova-gpu" <nova-gpu@lists.linux.dev>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"rust-for-linux" <rust-for-linux@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1a1cba8671a.1ba93626263271.8137996775533663026@collabora.com>
In-Reply-To: <20261107021427.2105374-7-dakr@kernel.org>
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-7-dakr@kernel.org>
Subject: Re: [PATCH v2 6/7] rust: drm: return impl PinInit from
 DriverFile::open()
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

