Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488397;
	b=zxaOuj21PFUm86r9SQ4M+5bcm8DiuGYu5UNQXEAUMWCifSIc2SC0X9EAeOJnStJpwb0T
	 yYCyzLfwUxjlWUwsqGd7q63oDAg8PvJJuGat4NXp3l6fklxPnUr03+aaSmrzm5S2n+yE8
	 +2pyzRMm8hcBqHHTo5V1/NYFlA5QzKfa11+vTXeJbZT/Df3kJqQiX1U4qN9034nklbN1+
	 IG5ViGx+edU9T+lH4mF4ip6EPHq1eEua8aQxu+2ITtCfoMHgOTHx0u4F9eaf9uHTJex8A
	 ebisLMKm0YyG86u087kiTdfnLzSS0X0MFb4vFNhNy2Hf1QNexYwp19XnclCx+jjZ/JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488397;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=jIVSLZ+nV6QTFe7lcxPhx/3voVvLmU+R5xaxWupgc5c=;
	b=AVNuvoXBFpf48pNIzZnqKUgFdrzI1tXOBNb3JGqyKB6razsbpnjJZ/HCsibWMwsDLqJs
	 uuRVfKNJx7GAytB026M1myCjb9WLw+XU/6L5DIZe7Ti3f+9aAWuIDFIG5xZnHwwSWAZ6I
	 8SpZfjs6yrEry257RzsJE/zjCe2gsQErjiInAmsvpgNUkojYDHJROVWsfFuMNP1y89FA/
	 vIT0xg6pd8gl5+1P6gFgxJAfEjwcvshO+ayFy0jJ+7mWNOYGPN0tT6WRCUA+Vzhf4CpeH
	 vkRyYckYhPcbGdZsNff6cOKieCA58jPoHdlXuGkWpSVv0DQZ1RozUHC4Ya29ueP8Czw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCGrJu3C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F6606A893
	for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCGrJu3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0F31F00A07;
	Thu, 12 Nov 2026 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488396;
	bh=jIVSLZ+nV6QTFe7lcxPhx/3voVvLmU+R5xaxWupgc5c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=GCGrJu3Cg6CS/4RuhyjRMrEKlR0CWNPkj3Bv6XTpEErjPhp/Ab8FrBsvjA6E50TBJ
	 /jLf23vc578olnUx7ETqvKYObDiXQVsrhCjWz4OqEDHDMOIgC//0LyAv9AzCW8O+Hj
	 QLjwS0vu3o5H3yfQAZb46M5mHSyXuthR5K096IEy9T+LxYh204I4P6ZcVoOyNmKxAz
	 3I2QESz4erP9UF6RUar6Tu6QRIr5B6MNq3jaJoOI8nNCG8bc4mj1sIaySMchRGtDNy
	 8XTO3k5q2OyNC8vwmPOFp3GFufhKS+d7lGUbWH+041cTQWbleQpdBfcWG9ZS9RrCy9
	 bI6O8oIRd6YMQ==
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
Date: Thu, 12 Nov 2026 13:59:53 +0100
Message-Id: <DMT91N7BGPUU.17BEZWQDLH3CC@kernel.org>
Subject: Re: [PATCH v7 1/2] rust: time: expose as_nanos for clock sources.
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Dave Airlie" <airlied@redhat.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
 <179448764517.621816.16006004780926601543.b4-ty@b4>
In-Reply-To: <179448764517.621816.16006004780926601543.b4-ty@b4>

On Thu Nov 12, 2026 at 1:47 PM CET, Andreas Hindborg wrote:
>
> On Wed, 11 Nov 2026 15:23:24 +1000, Dave Airlie wrote:
>> The nouveau C driver does ktime_to_ns(ktime_get()) to program
>> the cpu ns into some hw/fw, so allow this method for rust drivers.
>>=20
>> This is needed for following nova patch.
>
> Applied, thanks!

Do you mind if we take this through the DRM tree? Otherwise the subsequent =
patch
in this series has to wait for a cycle.

Thanks,
Danilo
