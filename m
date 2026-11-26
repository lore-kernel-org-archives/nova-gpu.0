Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732863;
	b=FtTAuMydKDMJTTToya08lIEFJRxxdMk9Pk0v52kdpIZENQKrHnj2OURyC5SptNO8wMr1
	 qQ78nSJyjFUqkTN5FFbWuL6XgtDtrHzbVuKxTnfEnZ+kFO1xj1uwRpjX3Kd/sd84uPYnB
	 uYBID6HRrer7VfrBZGKiGN0//sdaGJp/ivJtNcGENrpU1MI5o3O6cp9uVYvbSayq8y9W2
	 i/iMm9WphYL4J5ENnGpP+YTCPUTalnQFh+RujNDUpY3Tc4Pr++ziksh6ZqXeZpZmPqeeo
	 Se2quQQEIzz35C83F4Ckt6fGzESD7TgFYnlqEIIyFO2jpZsoSo9LXmtblCBfGneVBZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732863;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TNtqi5O4nLzvfHhnFH9DEQT5sHkW4Kx4CS3oVdX8k7k=;
	b=JCPSzb1wbjXDKnYd5OxL5CmMnUcipewrOFcL5uX5qYtkVNNT1wfKETEV68K1Xdacxmlk
	 fTpEmrwULkTGUW7RdSw8WpoKbVrl7XIxVxHPLiT3TGkILZuN4ALwXVlODjBlUt1G/qlWA
	 EtQC1dsRNlwVat8KZNEwMqTcIS56bf6AsHcn5+sGUiN2715iAw8Nbu0a5fpiaFMwokG5k
	 WOYHXLiKRPhuHYv7NEaLNWOpFkHfo3dBqFaxHKzRwZpUQ5zig+Fm57KzKDxQd4mW96rFr
	 iIFP+Ej58pYDMxTCo5t5SZrvXn7zGdUiTaNCVRTJ1yb4At+bcdnksJ0434TtqK8wQdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icoJSpSB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99176606A31E;
	Thu, 26 Nov 2026 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icoJSpSB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4871F00896;
	Thu, 26 Nov 2026 22:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795732863;
	bh=TNtqi5O4nLzvfHhnFH9DEQT5sHkW4Kx4CS3oVdX8k7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=icoJSpSByMLM/bYlvB+6OF7hYB6Pl63TD1Id7GaGvLBgzm168zP4Q/mvICPEr1Nzw
	 nTKz5j4j+pH+tZTclOqk/8F4yfbg0MbcxII+B4rReuquOZ/Atw5mYfhSzzJK2+hVn5
	 EI5Diqbhnvwt+LawUVp1t3Dzu+XO+Us93KwJNIK22z2jq6K+p56pBPMh3z7MBRgB/r
	 qed8tIlatoH6BfgGwG5QMN81EmgyBuNnHkcnk79miRJEwAPJLNChzFAiuQXdYcNwNz
	 5kvVYHl/0/x4abA1Xf2056UegGzu9sBNOHLi9TzS8K5aYCFWOhraU+cg0adEchA5CA
	 UcdAa2aPZJeyw==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpu: nova-core: use Init for firmware initialization
Date: Thu, 26 Nov 2026 23:40:59 +0100
Message-ID: <20261126224059.3856051-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122171353.963020-1-dakr@kernel.org>
References: <20261122171353.963020-1-dakr@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 18:13:50 +0100, Danilo Krummrich wrote:
> [PATCH v2] gpu: nova-core: use Init for firmware initialization

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] gpu: nova-core: use Init for firmware initialization
      commit: a3c13b902f14

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
