Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402713;
	b=HLTn8sGpSUeTO1P15bJEjoFNcKCewByIobm+R7TCjcR07IFO18dy1EIIrF1IE3WKZ9H3
	 MIrPYBfpCNMU6dxzpgAYXGgLTEoBppX9s7GHY4AUHKVeAwKJsBPTUHToxyDQ92tT9Gkox
	 V1BkO3s+hIkkNImsY4uOUH+noCuwPA97aAOP9lXSWaiV8macXMiXTkaLChGn0EsUSwWCl
	 YFK7a2BqbF+1f45ud0cznWGwWAwluYV5ELUdlFLe4K4GDBBM3KM8Q4onRiTVqZ784bbz1
	 8dru7Ct/9uCbemsSwnCVWQWINoD+9P52DeZHS9V8QVE7xUNRItWIriw1NBGJDsJ7RHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402713;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DL2rPmDlpHl0AQC4KjuB+rd+0hIrDyOK98A2P9tM2Cg=;
	b=woMBtA5PJzOqlbtQCST6evEMuoXqwZy0BZafW9lHblApUcUczJfCeoRzQo30Mb5rYAzI
	 MNZGuBSzcpnzz9OekB/2CygKt1XvAx6gN+PznT/1Q4x6R+xnvrapQ/uWwzYHDidBahEix
	 XaFOy70AC6D4K644bY/T4W5VI2WAzO96KUC5BTqkd+bCDrawtEaSmtvoop3cZXWzxbufB
	 HTlMCNuZK+2y9/X73tE+oduaYFjG9X1ajlh/OfttFctboNHmjq1yQyCzr589SLklz3ee+
	 i+B7xl8/yRYsRKG4UPMQnG9HYWXohUsWUo+CT2O9hq6DBfTSPO42Be6Q8RXvtlhA1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXehL8ub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E2606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXehL8ub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF601F000C0;
	Mon, 23 Nov 2026 02:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795402712;
	bh=DL2rPmDlpHl0AQC4KjuB+rd+0hIrDyOK98A2P9tM2Cg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXehL8ub7yZpKXjGcJ3Y/+tP1fYCjeD9LFGqcDj14ciP6aPu5R+5ypIH8DB6DCnhM
	 rw+9n4P9b9iAIGZgYiWe34LRB9VbywIY2J7NWnK/S8yLts+wX5aZ0twe+LeHBmkh2R
	 I9l8WiJuFsKIXlABPxdlVZEP4vfusa3djLAEki3CHmhXSMEfe1FB9cerlquAWCIcz/
	 WoHxzfCCDh1n3/BcW3f9YcglgNqSAOHuBE+yD2NFFpfBnaLv/WQpe66LqCKOUp2Jq0
	 LuvqNhPU6rhWp+7F8bVABaqzp4eRx3UDd312ythsZ9dyB/HHzHpHVn5QdoA4PL88f4
	 T28Iqqk8mGHOA==
Message-ID: <sashiko-outbox-228575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable
 GPUs to other drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:58:29 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/nouveau: missing Signed-off-by trailer in commit message
--

commit f8a48aaf87bee63f3410b9230037e0818c036931
Author: Dave Airlie <airlied@redhat.com>

> drm/nouveau: add option to leave GSP-capable GPUs to other drivers
>
> nouveau currently binds to every NVIDIA GPU it encounters. The
> nova-core driver is being written for GSP-capable (Turing and later)
> GPUs, so the two drivers compete for the same devices, with whichever
> registers first winning.
>
> Add the DRM_NOUVEAU_BIND_GSP Kconfig option (default y) and a bind_gsp
> module parameter, defaulting to the Kconfig value and able to override
> it in both directions, controlling whether nouveau claims GSP-capable
> GPUs.
>
> Distributions that want nova-core to be the default driver for
> GSP-capable GPUs can set CONFIG_DRM_NOUVEAU_BIND_GSP=3Dn; the
> nouveau.bind_gsp=3D0 kernel command line parameter switches it at boot
> time.

[Severity: High]
This commit is missing a Signed-off-by: trailer in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-nova-nouve=
au-gsp-v2-0-5e8c27aa8555@redhat.com?part=3D2
