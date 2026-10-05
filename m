Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652E4D6C27
	for <nova-gpu@lists.linux.dev>; Mon,  5 Oct 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230100; cv=none; b=EAz/Z86DRtUbCbFUPKpvG1z9QWWSR5wIqyhT8hk7nBs5cCOdOu+KWfILJVSIZyYpVYDf62DV+IzatNsPluVz7S5UQu2CdFf2+8WVKmstkMSS0NFIwJDlMsE+YleyAhLj71lpWOfpZd3htwuHaLvaPactCzwz6jYBW0+MClUlDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230100; c=relaxed/simple;
	bh=pr96mz6eIkWl8AxSruVHbuiHvTliKhtmBbv7+2W9dqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emU8S4xRKqnvyeZskieLJeyfMEs7ju4VfvSWJX8k60ZmEA6CrgBG9q3ua9xpoCl7faz4SJCetWNV/1ukl1rMRx3oFXu/LZJX4bMwQRaa9vIfN9jG7tqbLhjVRXb2Zo3BAj4LsfmYW7UikPrVGYKpYc68A+U7UtY+SuxXCRy/6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhVsS6wZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhVsS6wZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0638A1F000FF;
	Mon,  5 Oct 2026 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791230098;
	bh=o8BTHLMYQO0MrBAEYrrH/VAyUMq97kj7yvArQpSho8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JhVsS6wZmwNXkrYmHb/qvk1zznm+XdtKTbIX0Wna2NeNLHwHX6hQP9fsIZcFon4yQ
	 86JeawOBteeGARrJYJqQKh9maDpJI/Swet5brxdan9ujXHPfRMYdpasD0bGFRlv7dT
	 XdSJQA2Tl4uajMwB7ReFt7UtgHzMbkxxRDjVCZrTSU01MDkKJbOvvWdYsZxjLqY1b/
	 z/5QnOI8OF/pwWxz79+tc8mx0Q6SshfQsudLh+MZE1BXFL6gAJZOcz5BGvii2dd+dc
	 t7SWlzHLtQk4Zna8fMI+ersjIgxUMwxPqhRoDrxTsOlx05PK12tnweAH+qB81U7Wzx
	 VbFqu1Ywu1RPA==
From: Danilo Krummrich <dakr@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: nova-gpu <nova-gpu@lists.linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: Use bar1_resource_index() in NovaCoreApi::bar1_size()
Date: Mon,  5 Oct 2026 21:54:51 +0200
Message-ID: <20261005195451.39898-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001005615.77130-1-apopple@nvidia.com>
References: <20261001005615.77130-1-apopple@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  1 Oct 2026 10:56:15 +1000, Alistair Popple wrote:
> [PATCH] gpu: nova-core: Use bar1_resource_index() in NovaCoreApi::bar1_size()

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] gpu: nova-core: Use bar1_resource_index() in NovaCoreApi::bar1_size()
      commit: e56059016a87

      [ Import the driver module. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
