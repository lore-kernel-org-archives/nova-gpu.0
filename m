Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6811E318BB8;
	Tue,  6 Oct 2026 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325160; cv=none; b=V8CcvWHFkRAEADfEiparAVPDkcBE1krhjXSHGBgMjlbnBawN53h83S3cIvt89sHpKjmc6/758cJbPER0+LA/e4yPJlHXnqgcqF76578oYzvxa47GThKfBdlly9gHbxob9eF/jMETz55heJb6eYomIiYqKfpydQpNs1KzmEkkkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325160; c=relaxed/simple;
	bh=Ythw/NfjY1eDW5x+/1kEfCmBTrY14Ka7sawd+P1FLcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3NSST0/V3Gk4peyxP5PgSHmF4PP3S4aKqLL5YoNiJgKrNpSI5TrdcZ4Vk2W/BhsV5jqYlUNOug6w3oybFEcvTiuAG3zwjjjZcOQSbMon9tRTJZsBHwP2TmsNVTLdcCFyDfC5TtKwsn3l/zCU/V7hmzoS3U5IqbJUaFFE4HaRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2mrwbAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2mrwbAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516D61F0089B;
	Tue,  6 Oct 2026 22:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791325159;
	bh=yoz81NNJye7tqFJfq6/+j2f4bS1mDaz+zAr4Z6WtmlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H2mrwbAzBClnxhvRFMYxigOuYhKMn7ijXwR8Qrx7baAJeXzyic/m6tBEFFcdbAJ3b
	 VoCFMck86sbcQ3B473rFsrdvf4oTRZTMQgy6o0h9fJO2AeZTRbWkrueUiOTZl9s20l
	 I6tdnlA9vDXHWCbkYTmomZR0lddNauOLZb+hrjh6llY+36qmnCopBV4T9kdkXh6vSH
	 iDEQPZlOMuV11SGYuP24gpM1HFEtioraOxddAeH9jR2afox1U77MeFuxi9BtHvm/8G
	 OogBj/0hmXTmNeEAfst+35IcVpHnD1COUz/PbhXCbNU/Hn04yU2nK3aYqq0BgZVuMR
	 CKG0HfgpwfgyQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	Tim Kovalenko <tim.kovalenko@proton.me>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: fsp: use KVec::zeroed() in recv_msg()
Date: Wed,  7 Oct 2026 00:19:13 +0200
Message-ID: <20261006221913.41298-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006065437.58408-3-blum@kernel.org>
References: <20261006065437.58408-3-blum@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue,  6 Oct 2026 08:54:35 +0200, Thorsten Blum wrote:
> [PATCH] gpu: nova-core: fsp: use KVec::zeroed() in recv_msg()

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: fsp: use KVec::zeroed() in recv_msg()
      commit: 3e3404c52370

      [ Avoid the unnecessary turbofish syntax. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
