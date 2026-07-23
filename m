Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB4345EDE
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788295; cv=fail; b=htLfNyie4SBpcxEl3Smn0FNHrluWZqmyElgBK01aaq0OB7qnujxWvScMTkosTaktPdtLPkoDR48qfatRSy6pTCV8gdeQGssMA8hDYxtKWml7TAmTcLDfiSdW+5x8cKILmLdrsuiDkAAKb1avt7sMy5oy1AffoNo+t5FMiIMgVx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788295; c=relaxed/simple;
	bh=nUxwns9aBZ3SzZovRXSc+181uX2yPjaBwDo0adECYBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XG/S1O2pjLLmPBgx6lzRsboxBOQGtZkD+Yx0l7ktbWBwCLNiVOPczp3trp96qh1Pjg/lmbu9F+s2onu4gvuMUzdJ+dJyv/KC5VBe3j45pKB+FNnJ9c9sYxWKwTGB+4tLIAnwRkq4Cc+KxT3RU9PylaG/icgbIcQ8Unp7vrhO6Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H/m3btlP; arc=fail smtp.client-ip=52.101.43.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H/m3btlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZy9mOS8oCywPLJo24rUeA3xxRa8GVKhpWlQOFNwC/V8fH2qumtCrkTfMWV9rf3oy452DkV+zSrYMRA+qItKorOfTzzg1VGmpmdXvUHUfh2m7lf5qMJ9TmGrGsSOy9LnO9G61nIu3gfqwImfv6EjoprSuXPghxoN7MXmysAqmdgAMBvWapTf8XjX5Hsx5r4S0RqKYu9dvIRwTF8A3RkXWlTfSBF0KM4ITHXNoR0PmTJRnpSnN0lRMiN7qFzQa2F7CFfSxHxI+CM7aXBLldutUMNJCwzulipDGEmMTK1/L0+F7a//HcZeaGR1Q5oqsoeTjSbhDa+YWbHwwgZqENNjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MphItZCZsHePfRTVbUPppufbkiwK8oS8qz/uOgEMPAg=;
 b=VpzGufe12YsJSBl3Biv9AfRB4kahMdk4bK/dlJz/YeZrNGkl6UvsDDI0c8TvwG7VrtGRivHC1oZeldKOjdrhLxVhh8k5dK1MFLOw07RLSzgTaoG2MQNizHhBCLKcjdd3phnHpaSJFuPhuccNgd1W6kxmnfjSrh+Ve4twLbTwvyEzpueW40ggvpaDtknvcZtx6AH2l3N2XsoA+kws6P9pX0i8oSUd3jXSDp1xcaV/2zQVCKoHXt2jmslLoNgsYiq9FfZmgl4vf4gEXSu7dBJA1x4LD5HPvOf/HcAVFYPDSkKsg1eAdKW0PiLQXotTyFuhKGnq9noO1vXzzFw4y+iXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MphItZCZsHePfRTVbUPppufbkiwK8oS8qz/uOgEMPAg=;
 b=H/m3btlP5voDeCavtBFwa3NVYrlBXRKLwr4EcOj7ANXraDg+r2GLPJyMfwTIncVlKmIrWdt0kcxxyIINu0bkVdDQK0Lo2kdSLi4r7oRwEAU1bTDDqZAv6msZQmLS82hso5pkOEhNaTreAJqVbh8NpB70VM+xsDHlMLs99QYQzolzRgM9BJQ1LECkpCnwJwWfupR6cnaGT1ddpcGhYKWOkSOqVfj7bNBVV7luvEyl2p9PrbhCeE8v//ziPAmxM+A8Up3uNkz/B/8mKo8oq0Ppn+fw1sJ69E3O9OHUcda4LJN0PXh41sEYg9T1/mIWxFD/WovtKKaCK/3awbix6P4frQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:31:30 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:31:30 +0000
From: Alistair Popple <apopple@nvidia.com>
To: nova-gpu@lists.linux.dev
Cc: Alistair Popple <apopple@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 7/7] drm: nova: Expose a render node
Date: Thu, 23 Jul 2026 16:30:45 +1000
Message-ID: <20260723063046.1265791-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723063046.1265791-1-apopple@nvidia.com>
References: <20260723063046.1265791-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0028.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a975fb7-0a71-4a17-b09f-08dee8840836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|56012099006|11063799006|10067099003|10063799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZxOPYhDXjbdG4X6VNE6bh84trar/2xFHEAaIqtkbaGN0LZeyQtTC+MOM0nFKs9caqmAKIYVttnxceOuT/ZfwvxmCvGsQYLHmTvckiKkDNry4CDE98TuseDo3QeF+pMZ3QBE1xsY65AOiVN2wdtBeM0gEswueJp+CB78TzIdiK64eLU8PZnlmFHPUnjR0IzDuo28DJjWjT7Yf7U2PHrZt9oBMqMOVFkhuNX2wwbSFKWOqmXo7mbVe9SNM+yxP3oB2C7nLn2vZTC2NDs2BU0N7XKXJjYsNxQuTvrmEkD1varct0KoX8KSHz85pY4p8MlVZS4qx9xKA/PeIrQgK3Bjb3qB68t3NUXVPrZA5qtYiGWzhQ1FrTfniI2gj6TZpDFflStLvBwY4hLM9zfe/LdfM0FCi72wo8w6Nois8CPF+dNQNKkMZ8m9Cdz3kxNWEW74wfpOJSco10H9MX62UKiJXyoxKXzNM8NDH/VIPInrd8dIzJk/y+at5tERn2k/9Cq9blS5ZNaCZ6yC6iGLpN/LrSPRKzqTS1rU1z2CTCTIgE31EgIwuFV7+2QV8h+FfiuDLRnNSyVp7au49YLWTxMPfeGU6JrpnIInd3rpJ4UzO2XWjJxP4HTEHzv6RPJoo3pAhbJkNToG2GOZmV+Awg4j8zuBQkP3JrOr4JMxr85BWaZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(56012099006)(11063799006)(10067099003)(10063799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c2BhXATNfbqJXJO0dheXcsgERXgPs0SrrXkL5lXu7aOQqApFd4pQpatlnA9l?=
 =?us-ascii?Q?tWMYv1bRyXIErTM1JGfSYSvhdU3Yv5n/pM1uUugAgXxKGAayEaZBVMtzrF4Q?=
 =?us-ascii?Q?mls/eYYC5IUUcZBLSOz1lcO8kobY3mhUuMPyWB30VKfIMl7lfKNREV34Ybdc?=
 =?us-ascii?Q?1LkGy3EyoXeiH2RC5yK4ol7+q+jXvrn6qGuuXYpEbkFRtD6rNYX2qUzHdos0?=
 =?us-ascii?Q?5nx353rTY312FlDtXXVDr/jtl+7uQvJatXDir/i2OAz9OgDhwRRWLa0JcPn4?=
 =?us-ascii?Q?BCY3NnznQ7MudZCnLvvG4Pdxj8d+HZ0QLZA8M/lzOBpUYHMf9Orh17pNhp9E?=
 =?us-ascii?Q?y45qCU895nAKuCmDphFBdffhHoedp9jZF/Q3UQ51ejtCTT5GU7SlUwU59Oya?=
 =?us-ascii?Q?FLlL10dOjTHaZRgLCc/U9rJRE6LuZJKG2ZNGfIchfPYAg/n4j6OeR+z9FRMf?=
 =?us-ascii?Q?oCLjjQMrqci2TZGv0F7AaOCXU5dS8jrWbLOx05SZf0c0xK7xFjEfFGFTrPDR?=
 =?us-ascii?Q?3F8Em++nz5cZJtIYiw38eFWZT+Z8levjEFkD/hZUE/OOXd2spsWQOCz+jciv?=
 =?us-ascii?Q?2NctmJJC0EuanLfFoIUgUHVRmmcbNhRhBndQ1PTenRLlGQ9/qBNZuEu/Hidp?=
 =?us-ascii?Q?6AOWWMsUl5m+vY4Ag5VHB+x3tQhxGwiPXWKIYG4vdDycT7Jmf4GflKwVVpPO?=
 =?us-ascii?Q?Awu9Wdc2iF0esviOodCcNc4u1+FtxsIZQGPjjoffksofbQTPHTON1HyMbg3l?=
 =?us-ascii?Q?Hg3Rx5qvQVgvgdqoScZ/tk5AdNLAnGg62Fwv/GzsMRZ2WJHUfHni8hUFXQmZ?=
 =?us-ascii?Q?5NB1RGDn6fnSzZ6VG/DHKTW2mQffQu6ysUpbN27FgVEGbSFN7xPvK7Nh35pd?=
 =?us-ascii?Q?puTK5VGhu/UouGA5P4kkAq8IRCsm7uyFQ3Qx/OVv9lrNTS99fEfH0OW0T99f?=
 =?us-ascii?Q?jsfKI0XonujC+TzTxc0EZ/gmzuZd51aeTLBE7xmdewr8anQF0f4cPG/KMdRy?=
 =?us-ascii?Q?vbGppGJVhOUj00Ao7b8taGDab3gTPUlD6WPTl4oOjyo9nLjf2jajpOXXQivN?=
 =?us-ascii?Q?7n6J0lUGPf5wIVsX5Yr8imNDBetUKBomqb5AYivaPpn7jWFoxS4Kmcs+OxXE?=
 =?us-ascii?Q?bJSnFFSdZ5/eX2n43iOqzZ7OY7+9H/jS7/whFfdP7v0QtQzXr13EeUdUWPal?=
 =?us-ascii?Q?MFoxLIXh2iremHRtXyHaqDRvaG2uzsaZq8Kp8xyNJvBPxbWOYdBuEnhQftWG?=
 =?us-ascii?Q?BHEqTDOk36qza/fa68lJftb4IKXGeDnyWtMOk9XkFkkR4+WWxT8w6eAVvbtf?=
 =?us-ascii?Q?tbr6sLn6UyqP+UGFeGtwj+hNHrvr6kUbWPRcWg6+WvwrarqP8oaRlIT8nktZ?=
 =?us-ascii?Q?XEGT+l8r1pBM45W70DctY9lc2Mg4AvRs/3BvwnwqntzTps1i0Ryyb6+WKPcL?=
 =?us-ascii?Q?HdBMNp5K+qwLxy5Hpo8xApNAOebh9l/jSvSVbCva36I7d9pHeUX1q2twF3Hj?=
 =?us-ascii?Q?c/RgWzcSJr2myICg3t+Ufpn9Ig6unA8gmFHBTHfkvaIMpnfb1z9440qHQ3ql?=
 =?us-ascii?Q?eJeftA91E2jlOBra1ZyIHh0aAZSmRgbQHW4qrTD335f28Q0BeDzV33luMYoy?=
 =?us-ascii?Q?8GWO4ToLPQWXSYRl24ThunWylw2Ux9op4BT1m/VJxMdwaKMpZvG8TwOprre4?=
 =?us-ascii?Q?zysJswLkEGiCv6lQfXr1lDuhEAZMgM4wgFKR0Bz4F4ZxIQ4fuO0POhPsCKHF?=
 =?us-ascii?Q?yMzpekrgwg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a975fb7-0a71-4a17-b09f-08dee8840836
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:31:30.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55Z3C5QXFxvFUkxWrM8K6Otx5wqAX/tEo7EZX5keNeRDLf6eCpfuoBcAOz9Eeb8zooVqv5Astv4ppZjeh6oR0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B

nova-drm currently only exposes a primary node even though all of its
ioctls are already marked DRM_RENDER_ALLOW. Set the DRIVER_RENDER
feature so that a render node (/dev/dri/renderDXX) is created as well.

This is required to allow render and compute clients to interact with
nova-drm.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes since v2:

 - New for v3.
---
 drivers/gpu/drm/nova/driver.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index f144417b29c9..a9016fcd6518 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -92,6 +92,7 @@ impl drm::Driver for NovaDriver {
     type ParentDevice<Ctx: DeviceContext> = auxiliary::Device<Ctx>;
 
     const INFO: drm::DriverInfo = INFO;
+    const FEAT_RENDER: bool = true;
 
     kernel::declare_drm_ioctls! {
         (NOVA_GETPARAM, drm_nova_getparam, ioctl::RENDER_ALLOW, File::get_param),
-- 
2.54.0

