Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793848039;
	b=ekFUutt+1QqdlXjdqKImqufKcT4FNOO2X+65LOOc03JHgHxMBpTNm76clZSKYwvSH4hm
	 /6qbnreXOnLomBUbu5mXYtqnmxkn2kDb6iBkuMa133mdZUYZWuSHnqSuyZIWvt6ywCSPL
	 q6o+SGGUlOiLRNN42DpK6m6/yZ/wPJ6Hb/MS7F9e0iiFpwDpfYXzrD4vfYzXLpFpNpqTX
	 J4meC0q9qEFNTspu8YC5ZxhXhyDN6CUNEz5nK46jjiO8qTUho7t5w94cBPuJLYvPGA5eo
	 oMxcm8HUi+aAGdumgFUG7j/+SsWnDELuzKizCOSmxNYDWF7lY0zldRVj+dFX5qRFamw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848039;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XkSRDddPZA5jt0ASqkG8HjrdiJ5tucZZpac7dk5j6E0=;
	b=ZUXwCAynfLh3g/zMrjpQtFa5fAgxcQdvu5HilnLqpKeL6uZSrZAjXlYCzdWAqMdiDj49
	 gQASs/Vit/7xCzwfHF0WW1r0XS0CDzBRurW8+zBLIX2Fu5FuJXXYLrUPln+FYeDKcUJXP
	 27sZSn+zz55xkIlCwXO99Aqjtq8KbsdGib2lQkUnnrSjMrtr4h/haV4IlkOm35yiOAaW1
	 Dca7Y7E7zhAWYPjNkbJermMzb3A8VDpcfCU0GdNfLEFLxY8SHIXATQXFzrsAcL6HW/brk
	 QdIDyauMP4mK0+Rqbp5m32iE1KRPvn5yViJClQPmiosfZ9tXfu6ojGrQfj7okn7/INQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4B8UTMf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEF606A334
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 03:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4B8UTMf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793848038;
	b=RkdhYg6WhRccg+94RqV4wtKZgJf4RgExVpDgTMt9azrTkaN6dpHNsKckVqFUpY3BKLDd
	 dVKtWINwAT+V/pR6ISN5IoyyqeXcb0jUSTx8/1ZF1KMkZdGbX3oKkFn5mzJOrkyDYkp02
	 0JhaWQI6OTIDxHgUKU1bruufCf5gNufniocNf+7Phsl9Fnq9Ikq2Tcb2Fobuurlv/MXoB
	 2UUk9oCrJxWH2rZrs7UsdI/1Nyz/Y7/y97MPy6N9YBzcDf+gWTyGYCoq+dNFw7K5D26Jr
	 QbRyBhwi94d10VtaG4dTEdx85aH86GUaHG+Onv3w01bykixlU5LE/Wyqa+mSbKuvOFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793848038;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XkSRDddPZA5jt0ASqkG8HjrdiJ5tucZZpac7dk5j6E0=;
	b=wGMuCZebwx2O+xSrYDi/wLEWFn1j44pvwMAEPtaIodNF3j3xege3yRS0RwBpmTUKvMM+
	 71BaD69kkduqXFHpimvrlfNyXwkSfa0DgOcpfBa8lY0Tb12TNiNHPsGlKsWT3S6OO4dfE
	 q5pbq0Lfpjwv2V2KTwcrWBxQz6tKydvj02Svgp3mKNdTduezjQnwFJ4gL23GTJHoo9gpj
	 8pTzeMwDOX4zUgay1KrKzJk4QK516zO6tXEsjoiRxpIMkx36r1GhTR28gRXytQYj8Zsux
	 cCBpgjFjCitf0TNTTwpRLACdkOh8XhBRU2w4yc/22cA+L3tGHVLCn5xrDA6pOoIgFgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53E591F00A21;
	Thu,  5 Nov 2026 03:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793848038;
	bh=XkSRDddPZA5jt0ASqkG8HjrdiJ5tucZZpac7dk5j6E0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=W4B8UTMffWpkIh4UmkqaRAcGOVCRFX/HsEKfeo7Bkplj05Bt3RjqNaUxo+LZ5pbQN
	 MdFmvnVtKCJFx20FnoKupTp990wTqpHzeS8jLjQ8Uc9/uSDdhypQ6ehcuFKMC011Az
	 wHpOmr7KPvoSau0eDpCB9eaZ455h1UFWR4aEcre3U2d5T6Ke2vQib03dl2rOj8dQNG
	 3dwPtoWRqMIs+q25Rse2+DweVHY8MVlRf+Q9ttMAaydMjgTrP8qtWdxWf4kW2Ul0Ll
	 Xev6yqo6cxGzVGqwco2dsKtwaZNVyTx668x897lWbIOnRgNlhwpFlPNQ8UFfwYjT09
	 ul9I7Uiy8Qf4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A5A8847064;
	Thu,  5 Nov 2026 03:07:15 +0000 (UTC)
From: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>
Subject: [PATCH v4 0/2] nova-core: add initial support for gpu timer (v4)
Date: Thu, 05 Nov 2026 13:07:00 +1000
Message-Id: <20261105-nova-timer-v4-0-45a7c121d4de@redhat.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw6CMBSF4a2QO7amr4A4ch/GQUtv5Q6gpm0aD
 WHvFkaSODwn+f4FEkbCBNdmgYiFEoW5Dn1qYBjN/ERGrm6QXLZCcMnmUAzLNGFkXtveoZKdNgI
 qeEX09N5j90fdI6Uc4mdvF7G9fzNFMM6s0h0a12rd9reIbjT5PIQJtk5Rv1YdrKqWD7631uDFu
 6Nd1/ULOc7xM+EAAAA=
X-Change-ID: 20261102-nova-timer-f4b9de3274a1
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=airlied@redhat.com;
 h=from:subject:message-id;
 bh=gmzSh2vYZ5T/6/GkbD9fkp9oFKW0guaRJJHQCAjtZMI=;
 b=owEBbQKS/ZANAwAKAQx081l5xIa+AcsmYgBq6/Ldh79zNkPvkT9lxN+SDhjUzWUJLw0mA2eso
 OTyMjfAqU+JAjMEAAEKAB0WIQQQptkdobBb0p9t66wMdPNZecSGvgUCauvy3QAKCRAMdPNZecSG
 vlHvEACOX7OQGTHa/HXbcHfQeXhUh9ugawpcZnUOroGXIfdKcIyEiXEd/Xt1YC7QYNvHJlO+jsO
 lyEkikNb4YiKAtHHakVagbECLnrEwBlFCYScN1if79AdMptzucYoX0hyYeanPlLhyccEk/UkPwR
 Pqmi83O+M+iyw/6xH5PG5gZKecCZcrgyl+PNrCjyE5W6cfMVTXkTgM6c5rXThFUuNdtSTSCrYMz
 4BeeGAk8MWa5QutxXEbUYIrYFZk8ou17vxebG0ix5WwjNXI1VxluI1u+XWoCZnZsI/Sx5cPUSjb
 BWIMhKs1UpmzF7d/to/vsGIdNMh77wMfJ2jOiPrpMAjPM8mpcjc5dLxQEchuIVf3VAePUDcsQ9Q
 StTPHSenra6m4BhUYYr5PcXT4lmkgkxIufkTMPBhx9EcnBvpFdLcYTL8W7t8H8j6e6L3jb/+JkX
 h1DxaochVusW8Ya0vurPl2BJ1KJG8n/z/q1ooguurRfRCwt7vjzoXQ+yS1+AkwAgndTMZ8rKH8n
 /gvW4c5xanvg0qEkkxaenshbDuafefscnMuiIlKeQ+6IH+hPPjGHwFtKF40aoJvYH7ceSyrD+u+
 YGjxoiA6joscR1Zq78hZOcvpTWlAM/2WGlCsgldSYMc+pHBPIM9CWrD6pZrfLEXlI1GJ/oUXXun
 w8uSVXEAVru/RNw==
X-Developer-Key: i=airlied@redhat.com; a=openpgp;
 fpr=10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE
X-Endpoint-Received: by B4 Relay for airlied@redhat.com/default with
 auth_id=1321
X-Original-From: Dave Airlie <airlied@redhat.com>
Reply-To: airlied@redhat.com

The GPU has a timer, one of the pieces of information
we need to pass into GSP init later is the timer offset.
    
This series just adds support for setting up the timer
on Turing+, with hals for Turing and Hopper.
    
Right now it calculates the value to send to GSP but
the code to send it will be added later.
    
For some hardware variants sending a proper value
is required for GSP init to succeed.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
Changes in v4:
- reworked register handling
- used a timerstate.
- Link to v3: https://lore.kernel.org/r/20261103-nova-timer-v3-0-0cf9bbae8fd9@redhat.com

---
Dave Airlie (2):
      rust: time: expose as_nanos for clock sources.
      gpu: nova-core: add support for GPU timer block. (v4)

 drivers/gpu/nova-core/fsp.rs             |  5 +-
 drivers/gpu/nova-core/fsp/regs.rs        | 30 ++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  8 ++++
 drivers/gpu/nova-core/nova_core.rs       |  1 +
 drivers/gpu/nova-core/timer.rs           | 33 +++++++++++++
 drivers/gpu/nova-core/timer/hal.rs       | 27 +++++++++++
 drivers/gpu/nova-core/timer/hal/gh100.rs | 79 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/timer/hal/tu102.rs | 53 +++++++++++++++++++++
 drivers/gpu/nova-core/timer/regs.rs      | 82 ++++++++++++++++++++++++++++++++
 rust/kernel/time.rs                      |  3 +-
 10 files changed, 318 insertions(+), 3 deletions(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20261102-nova-timer-f4b9de3274a1

Best regards,
-- 
Dave Airlie <airlied@redhat.com>


