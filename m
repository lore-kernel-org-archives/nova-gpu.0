Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521605;
	b=DoOU/6NFZF2F4U+/D4SKEb8ek/4noUbyYVsZU6poOIvWa7iPouDDzmg/AimNtcHtulsZ
	 FRLRrRC06GsI00dz2rquC4+eyX+KVyHT7k/zYCbF3KvzvIi0M2payIOlVDdhdsVkgUWqA
	 hsrevUlgvY5aQzU7pFNQPAcGXsRWeyb2/V8FnlSZ+/VBowfJMQ4rHBHZe5I+qq9eUYGOq
	 iM5CgjVurW7te0uJMuatLzMBLP9Hx+SXTvXl8m+ykHTAETJIX1nmm/DQWK2OEvOz7d2YG
	 7NOslVtY/1S0zEcQQak6exvKDQrGo7nUhUJwawlSCLHpvW2m14xrqJaXnV3IAgAI3dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521605;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=VJLol9QNgQ8sIKCWFbA7w8PHUKOB+IRHa3RMNrUFjZU=;
	b=Tlfl8q+cPDQLAPc2leVrGVIY6vMCaaNG9jATQB3qxq5X/jYTlxMX2AfqE5T2LV8PBYqN
	 sOZOXezWwI0/Y/XP/hzvyZEdYHbDGDXZiJIY5ISrQKB+SqT4GDlc6vYAoAvrPqoj8Swka
	 ykA+ZajCEUppmqSGm5wSw+9ZXnp5HigD1WFRFKObGULXeUgpUvq5EplwS3I+s5kz8JANI
	 gIrPNpbiJb8C2990pe/gRKlIWtZ+K3tCd/9OibKnI9vl8qxv8GAPpNAoh1IFm0oTIKcdo
	 o6/GXwbpmfczN9DtyYfNjcYM3j2zZSRVd8l3Igwcb1mrp1r+eYsdEZa5KDhOUrprOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4Sx6EYH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4C606A31E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4Sx6EYH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827EF1F000CA;
	Tue, 24 Nov 2026 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521605;
	bh=VJLol9QNgQ8sIKCWFbA7w8PHUKOB+IRHa3RMNrUFjZU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=O4Sx6EYHLxDJiMmqs4rZeop3a92PV+k7ISEmre12ro3B6AL5qxuvuKcgFaiUtVEWN
	 yuj0fP+wK86JN0o444myEpVzsj3hhv9iDCFGeZLk76Zs2il91I6GnCZejBdPbyd2bj
	 +UdR4hbGIzxUSmqAtzL/+jXbnsE2qqKsCk/2dFq1UehRWx3YtBCo5QgqUBHRpacmOc
	 ewAj6/7+pcHe3ZsfcRVvK5W/7cvOrZgqBzINKTqO41mN3R61P+PO0pAqT6b6CpPZE7
	 zMhu5W96onuEsbJeMaKP5idsB0M6difo03mREs8IvdHiygXE9GMT79y3/b7wd3TmnZ
	 R700/Jo99UmgA==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 12:59:59 +0100
Message-Id: <DN3FABTSKUC6.2VK9DKQIBAPFO@kernel.org>
Subject: Re: [PATCH v3 2/2] nova-core: only bind to GPUs when explicitly
 requested
Cc: <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <nova-gpu@lists.linux.dev>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
 <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-2-e1440479ded6@redhat.com>

On Tue Nov 24, 2026 at 6:50 AM CET, Dave Airlie via B4 Relay wrote:
> +config NOVA_CORE_BIND_GSP
> +	bool "Make nova-core the default driver for GSP-capable GPUs"
> +	depends on NOVA_CORE
> +	default n

I've replied to v2 regarding this: https://lore.kernel.org/nova-gpu/DN3F752=
1O232.LXJ8JBRTSTPQ@kernel.org/
