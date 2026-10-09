Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9464F30F8
	for <nova-gpu@lists.linux.dev>; Fri,  9 Oct 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569301; cv=pass; b=JhZdOT20uTUXgaaZTEtpTdeat3Kit+vmwmXVStXUI7rPygyM3owqmPxnVU/N+Kc0gZpprvHvxpz8s+Bp6fyqwGdksVr2mECVCm7HTa2vWmzNmJhTj6a9ISVmi589dxxOoaL9Ahau2wmRvGKNOROy6xe58BRgNTJlDE4bRNGILi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569301; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NyJh1uvZ3K7KeDwRMHXh1TkG5Ek3p+5hkr+WGZFsv+rTmhoOOh8kV6Nu/TLHpC8Z1NpfQWJ9YoGGWL0EsySzvdfns2ypvRJCLEu96eOFn2e6NO2ODpfTH2I5AHRjo0MP2d4kKdFZDbKgRGoppddtgD18OxEQ4+E87/bVy2Ar2Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JpQ7O9UT; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JpQ7O9UT"
ARC-Seal: i=1; a=rsa-sha256; t=1791569281; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=clme1yHpoHM+G6HOjxsv8j0Im65+8ioMiQ4PVBiExb32hj1KRvJxq97YBnk54Iwp+UUkkENU8h0VfGQHRkiEMJ6Ry7oYZ1X41iQODgbw+XspaIuOqOXwlnf4lPvY++5c4rromdieBx2A8+pkI4ZILrpiooafMoQBO6YuBnFWwAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791569281; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=DO8VZn4+az+xFVqJIr+HbfpIcbj6/fIdzvGtNdrgxXCNPbxZmdBlAPFvh05VHWQYPS0tKBx6AUlDax3v2P/Zr5r3aY/oaNf27Nf99VYERiiHTMeS0Ye8Kt8GJJlEo5fQNTgu7NscCFM2YEAAc6WviGNMf54jagVr2Zil5YXN43E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791569281;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=JpQ7O9UTstpCzFaN6DKHwo1CUZkqiojs6iemZ9KZxF+YBkTF2ePlGd6VZo//+Thi
	EHIDQEc2mX2E92WGN/647ran3b4+BbJMHP8YBYj+47SWqGYYZ8zO0Gjv65KJuc4a16H
	CtbeOxOJuXyytKlUhFpFdieshDO1yibhoQaw/MUU=
Received: by smtp.zohomail.com with SMTPS id 1791569280936665.7129691219392;
	Fri, 9 Oct 2026 11:08:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 5/7] rust: drm: wrap fops open with RegistrationGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260814230923.1292966-6-dakr@kernel.org>
Date: Fri, 9 Oct 2026 15:07:42 -0300
Cc: aliceryhl@google.com,
 acourbot@nvidia.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 work@onurozkan.dev,
 brauner@kernel.org,
 lyude@redhat.com,
 j@jananu.net,
 alvin.sun@linux.dev,
 deborah.brouwer@collabora.com,
 laura.nao@collabora.com,
 beata.michalska@arm.com,
 nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8C194765-DD59-4C6E-BD9C-88C012513296@collabora.com>
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-6-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
