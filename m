Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044927;
	b=ai5jCsjsP55R2UmFru49xmNEES/xOeumnxKG7cg66crs/AO9NHJepY6o1NQMuobeYtjF
	 ZLxDqxyqte7/QyadyeS8v1dZYmtK/mutqSkNVz74Zh9cx0c91FB4J9Cq3HE80MMuwtC3s
	 n9+yJyILeet3cFyQTuaNZVpmAaaESW9TxLJAQlTgwKSP7f5O8IOpwGISX8RjojX/G0OUP
	 FLTLJe4RRUsI93XpkXMY29+J39y0o9Lanf2W+OJirp2Zbin+LblpmCrCxbv2WtwpMOhAR
	 rAMqYUk9W9jP2kgfhPY8TqG2XLQBwKI3KQgq+skL11PtD20n+sMAGhFABh9lL7MYxjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044927;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RhZ7CYQIdX9kgRlesIntBwInLjiK59T2da65omTW0Lk=;
	b=Gsn16Lpm0KJYRutgw2rxduvsIbPBPyntLwE0xr1svUOtGPRbrgC9+DzqsMdViFKr0Wzx
	 aAnoFeRUU061vXjcl2+hm5VRWQ9vpiUAHbDZBNhWnHOn/PDguNUNFQrXmzHq1InanF6WU
	 MJeXr40i/whH9H0pWe0N046wCnPex1szx8BRWWCbPhSMdh3ev1UDrUnQ8/HuBJvwDpdHN
	 0TjywhoHJso6usiq9tFv7dqncrTIHZ+FMvAMGLEn74v/mT1PQN0HM76bf0losyfkorKyf
	 RI3G09dCCU6Tz+E0bxF4ESIkThADDlXhx38Ffs7OCkTD8q32PtSVuGY4/xRogVCjqng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MS+iU3Rv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3FC606D826
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3FC606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MS+iU3Rv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1/Z4KTE5VVvSy8IJIiNn8viROxTtIaW7yvhUoPYTbIKSyWZUFswXydn9wxthYAjUvo/zGAtX+6k3NPoyr533MGZFRbj/YIR+SssK+YPfM2ocbEg3Hg6O10qIoo3RBDxT+fEtrcpABhnE/FYZT5Ai53iJrU+CHu7dciJIi2UeRwDRSg1CXypQ5vY6pJYUWBJs0B/yPi8l73XvggDmtfboXcrJv/yY5DEIA5S8xMggZYHeUtcdq9vr4nDezVAhPIRKuFnUWXbGx8m8l+gNbhajq2Xd01K4W+xlu4C8JWwMqnEQdSAdFEent2hKlu7p4tajiYkxXvxGA4vUf1/nTgLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhZ7CYQIdX9kgRlesIntBwInLjiK59T2da65omTW0Lk=;
 b=GE0g9W3mOcybdE8TJKaHFfcwNt6NlQ/2NFc8XyNSaGUid2jCxvITodbSbOw3UdZ8OMNttcoJ5Y3D35gLbJ04Eb/y1zxwZgDOZZLbtywmBeHlPR0Eswp6l6CmcY0tjd4N90Ed7ODXf/E4mVVPZBY+uevAw7AXmN2QT15xPKVUPHu/0fyYEk+TRPPW7vYky7xJ9GSwuGHyBoJrtjS0FhkVZoU5/X5ivFBO5oaOT9Bu75wmWU+Zty/mBj27iMqA/wv93327IXrfmToM+B2yoOkxkDiP0jBYKiAEFiqVZMjMPWVL0joo3JmTtQcQGgv+ewr0qKmkMU4NAbfwx3aMc4pdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhZ7CYQIdX9kgRlesIntBwInLjiK59T2da65omTW0Lk=;
 b=MS+iU3RvJBNNibbty+MEHip7g9glQ9bcDR6oKiLk3qCb08BOOUpoQWQTtv5TntNGFv1w+FsQwgCzPVBPszV9hoKgIY7KFeKB2sNFFyMt/THT/18Fw24CcgqMRUaNBe/lRgWzUlf7Aaus+zElnj28xu7gEBTNn5ByxXtBBqmM/kIwQCbFqZxKjXO9gaQfYF0KtuGeSoftENR+JcKrLLQvcUk/ueeFZjB1K4Q8d7wh55c1pc+3WyMGAecWB1q8KDqOzn1aGKe6erXkDycBcQY2Q2iCwqpr99inZWBtrUZ3IXvAfekBxwxIPRUOQ3+2SoiL80fWPRiA2JsWqDUcKQwVdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:32 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:00 +0900
Subject: [PATCH v2 04/12] gpu: nova-core: move the bootloader DMEM
 descriptor out of FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-4-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 360553df-7c97-44c7-e90b-08df3cb4489e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|3023799007|261022105027099003|11063799006|5023799004|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Zf20A9dz2Xs/SHRDNirVeFofuUxTdPEm8xtXbZGtPkb7yL3let01ZNm1ZjEyAZDiwynGxKSIiU8EN+IuWPWLfY5RAsf4yPx7vjeBG+AhujdI6Xmj/xmETJOCnfzSXE8jgpZJUKusJOBfRGP00N3BOSf6MH+SD5FPCEJqfwtpaUcWRqO/uoIoEiDmSt75E+imzqxdY/MnM2MGJ7xQoNahOz5zu+jijv91foj0YrTXP9rdBe/ghMnSzqbZiR1uh5NBSJmECxVNyk1zbxLbsTkF3dBqjbr5xguNbgdJ1GFP+cr1RKhHPizniI0nWpokV+gr3dX3+bfovpSBChw5iuWnmofrOtDYqSyWYxr/TMp+8fjb4DkUQ9upqQ56KHUgDfH+zwqynZ0rbRyhV6DZHaKYB9EMFXMD61DQPcCDyx7VJbWD4Xp6PQfxXUbjHIbR7WdgVAaauEOchTQNO4a4r/ev3DHTPw0E51YBFR2/pux02A7F3yObMaMz2OSh8WrXxinxb6KTlawOGIGnxdktGgtdeACSRuieeZi10jQ26EpXlJqwMs/vV8RB9UFyGlQDIO1WtEu8Uw6jHndko54A5f22K1zR7DtVWKEBfVHY4oB2lDMs2akYLFRDa1DE6F+5sK+SN2mjtCkF3rIGmA/vjicz9sh+8zTL8nsVNdpF4/Qd9+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(3023799007)(261022105027099003)(11063799006)(5023799004)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkovTWtId09LZW5rVVVQVUpVYURmcW16Y2xZWkZVYjFzdjh5bnN4MCtSbE55?=
 =?utf-8?B?TUEybjZaakJrc1NpNHVOT3dHaUlDYU43TC9jUGdtMnpZV2hkY1BZY2E4N2Q2?=
 =?utf-8?B?dU83YnhGbkxmM3EvYTUwa2tHUDg3aDc2VTlWV3orSDRVZjNVV0NJSWV0TXlZ?=
 =?utf-8?B?dlpTV2JhVldCYThMaVBaM29URlUvTGN2VmdXb045QjhJbEpTQnMyakg1MWJW?=
 =?utf-8?B?c09CQTU3YWF3Y093eHJ0eWg0RTRucGtadW1CQUhBL2RLY0t6ZGVPVm1ZbmRF?=
 =?utf-8?B?RTNNUjJRaW1KMnFCeGZIbU9JcWFqaGFncFNwdkdQb25ybVFKZmIwU3pjcEli?=
 =?utf-8?B?OXMwZW5iQ0xVY0FrWmg5YTM1VW42Vm5XemJqbGxtY2N1U3RNTlVITzlPeFJy?=
 =?utf-8?B?Y2hPWDNoR0tOZVJJc09hVHFETjU2OTluKzViN2V4OCtHT0Y2VjBvdTRkVEs4?=
 =?utf-8?B?V3JXcHZOZGoxTzUrMnBScGh3aWJSOVJCVXJzN25jTDNvN0dKMllpYXFJdUhq?=
 =?utf-8?B?L1NnSFI3dFhOcVdPR0hndWZpRG8weTd2a3Q0TnYrRmNwakdXK1hzYVdGV25G?=
 =?utf-8?B?V0JZNXc0SHVvekcvTkNQY3N4Z0dWZmhQZ3NCSXVuSkRkTnZ6NzJpc0pudFpl?=
 =?utf-8?B?MDhEeFhXRkdvazUzUkdGWjFkd3lMcisrL1ZxTWZkUXZ5djBmQXVvVEs5SzJK?=
 =?utf-8?B?ejFNQmptMmR6TGRDelBZZzdJZWNNQnNHc3RDZEIzWE85UFVQYXJrU3JQYlhH?=
 =?utf-8?B?ckRZZjNRaVZVNDlGZllwajFWQ3dYNDY2cjZ2MlA4cDFBOWNzNTB3bnF4YUdO?=
 =?utf-8?B?eFRyQ1dkZnh5VnVjc0pXZWtYQllQbzBUdi9KVmVMdUNZTVhtUERiM25mMUZR?=
 =?utf-8?B?RDBSd2hob2hvdWlsVFFRb3NnRDNiRHZIUGhOVDVqdUdrTWpsUC9RNjFMZVNs?=
 =?utf-8?B?VGg0dlhNNENpVEc0QjFhR2FkNUgydmRTcGROOHlZMXRmMmlVVWpkajc0SDB3?=
 =?utf-8?B?Tk9qMVlPMExuQnJZcU53Vkw5QUpMVnRLYi9LRWhndFM3eWJhQzhlY0Z2TzFn?=
 =?utf-8?B?SnFxY0hPbEp0a2VJMndKdmpWMWxGd1FDSXVvL1VGWVNwaTF6VFJRTkpjbUxa?=
 =?utf-8?B?alRscU1ydjRYb1Z4aGcyU1RaV3Z4QUJ0VFp1RmpyaitLbVVwaTF5aXpxUHEx?=
 =?utf-8?B?Y3NjMnBNcjA3bUE4QnZiVXp5aTNxaUZFUUQzTkI0MGx1bE1oTDAvQ2pMeGE2?=
 =?utf-8?B?MGFpcUE2b1lUQXhRU3E3bTBuV2p0THpCUUlQUGw5VlJuNXlTb25hVkR4UWJo?=
 =?utf-8?B?Y0JCaklQWkJsbGlMVENlM2g4Z2Nvam1BL09obDU1b0R6cnFlamhQRHBWYVRj?=
 =?utf-8?B?MHhjSjJRS3BPN3JkSUpUOHhNY3FSQjJKRW1pOWE4YmJqbmptOUdrNjliRVdw?=
 =?utf-8?B?SllRSUVCbmhKR1VwNU11YjdkYUVwcHlNZDhualRSSXlTMFFaUEd3am1FVk5J?=
 =?utf-8?B?aTVrNlRVdzdqUVhZWXVQc1dWczh6RmFURVNCc2V5VHIzNGZpWmZLQlIrNXpH?=
 =?utf-8?B?K25VaDVldGJJdzJEVzdjOGs1YVUyd1RLMDN0SlNVSFV6ZkVJWVpyNE9ya1Uz?=
 =?utf-8?B?V29LdmdCbUErYWVabVVZQUVRdUI2T0hCeUtvTXh3a2k3dE01T05kNFpKM2Y1?=
 =?utf-8?B?aktPVGFvTlZOdldROEpvWW92RDRtOTJZOU5CdXhDMkRBMVJHeUZwbGV3UkVG?=
 =?utf-8?B?ZUVLYUQ4S3AzdmR1ZDFPODVBWVNId3psT051N044NEZxcE5oRkFTSnRXdERM?=
 =?utf-8?B?djhZcmU5OTVQdExlYXR2dThKZ2M0RFFSc0xyN21vR2JWbkxjeloyVk12eDRM?=
 =?utf-8?B?UndrdFZ4R2dHbnF0Zy85YklvYzVVL01iOFk4ZWVRQ0JOV0EvRGNWOWx0RlQ5?=
 =?utf-8?B?N0RzZUZNYXptT3lGQmUzeFlBbytMaHlOT0ZINUR4bHJFMTBBd3k1TFN2d2dR?=
 =?utf-8?B?SFJyK0czdjNKQ2dFdFlYOThLNnVIMWtvYTNKZjJtaHJjVXV1WFZRV0NSeUli?=
 =?utf-8?B?Zm8zdFI3ZmFySWVMS0p2eTk5bmx4Nk9ZK21wQldRZWNCb1VMcFIyZDk1YUZ6?=
 =?utf-8?B?WkxoVUVxQXN5OENTbEczMmNHNFhxN3hLOGcybks0MGE0aVpBUE5tTHozTEJs?=
 =?utf-8?B?NkN3L25vR3JuRDZKazVzdytBSSs3UDVWK1pmWFdBS2hSSjB4Kzg2bDVpVU5U?=
 =?utf-8?B?UDZVSFJhTnNMSi9LaU1WeW5kblYzamlxZXRoZytIVHNYOFVnTEpzbnUyMkRh?=
 =?utf-8?B?OWN0VHd3eTVZZE5MQ2Jac3NEMWsrS0tFQUVXYzdlOXIxUFBFRUF2N090b2hu?=
 =?utf-8?Q?eCESrTlYvdUckwcCWM+fHy98s2bG2buKL2zX5hjZnfgiZ?=
X-MS-Exchange-AntiSpam-MessageData-1: 8dShT8VqRpgjVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360553df-7c97-44c7-e90b-08df3cb4489e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:32.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN0R2zaw8dx08vKcy7oHCGVrLyfOnlima5lvxmwAlRbRp8rY+glemwUf7kV+2oQqYM48owWHfVwBjC2kh4HA1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader reads its load parameters from a
descriptor that the driver places in DMEM. The r000 load-and-execute
bootloader event carries such a descriptor, so its handler will need the
descriptor type.

The descriptor was defined in the FWSEC code, which was its only user.
Move the definition, unchanged, into the generic bootloader module.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: keep the fields private, add a constructor and the ctx_dma()
 accessor instead of making every field pub(crate)]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 95 +++++-----------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 94 ++++++++++++++++++++-
 2 files changed, 112 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 00f0d9704883..19e047f1c1ed 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -35,60 +35,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        gen_bootloader::GenericBootloader, //
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
-#[repr(C, packed)]
-#[derive(Debug, Clone)]
-struct BootloaderDmemDescV2 {
-    /// Reserved, should always be first element.
-    reserved: [u32; 4],
-    /// 16B signature for secure code, 0s if no secure code.
-    signature: [u32; 4],
-    /// DMA context used by the bootloader while loading code/data.
-    ctx_dma: u32,
-    /// 256B-aligned physical FB address where code is located.
-    code_dma_base: u64,
-    /// Offset from `code_dma_base` where the non-secure code is located.
-    ///
-    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
-    /// expected to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    non_sec_code_off: u32,
-    /// Size of the non-secure code part.
-    non_sec_code_size: u32,
-    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
-    ///
-    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
-    /// to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    sec_code_off: u32,
-    /// Size of the secure code part.
-    sec_code_size: u32,
-    /// Code entry point invoked by the bootloader after code is loaded.
-    code_entry_point: u32,
-    /// 256B-aligned physical FB address where data is located.
-    data_dma_base: u64,
-    /// Size of data block (should be multiple of 256B).
-    data_size: u32,
-    /// Number of arguments to be passed to the target firmware being loaded.
-    argc: u32,
-    /// Arguments to be passed to the target firmware being loaded.
-    argv: u32,
-}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
-
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl<'a> {
@@ -141,9 +97,6 @@ pub(crate) fn new(
         };
 
         let dmem_desc = {
-            // Bootloader payload is in non-coherent system memory.
-            const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
-
             let imem_sec = firmware.imem_sec_load_params();
             let imem_ns = firmware.imem_ns_load_params().ok_or(EINVAL)?;
             let dmem = firmware.dmem_load_params();
@@ -155,30 +108,20 @@ pub(crate) fn new(
                 return Err(EINVAL);
             }
 
-            BootloaderDmemDescV2 {
-                reserved: [0; 4],
-                signature: [0; 4],
-                ctx_dma: FALCON_DMAIDX_PHYS_SYS_NCOH,
-                code_dma_base: firmware_dma.dma_address(),
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                non_sec_code_off: imem_ns.dst_start,
-                non_sec_code_size: imem_ns.len,
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                sec_code_off: imem_sec.dst_start,
-                sec_code_size: imem_sec.len,
-                code_entry_point: 0,
-                // Start of data section is the added padding + the DMEM `src_start` field.
-                data_dma_base: firmware_dma
-                    .dma_address()
-                    .checked_add(u64::from_safe_cast(align_padding))
-                    .and_then(|offset| offset.checked_add(dmem.src_start.into()))
-                    .ok_or(EOVERFLOW)?,
-                data_size: dmem.len,
-                argc: 0,
-                argv: 0,
-            }
+            // Start of data section is the added padding + the DMEM `src_start` field.
+            let data_dma_base = firmware_dma
+                .dma_address()
+                .checked_add(u64::from_safe_cast(align_padding))
+                .and_then(|offset| offset.checked_add(dmem.src_start.into()))
+                .ok_or(EOVERFLOW)?;
+
+            BootloaderDmemDescV2::new(
+                &imem_ns,
+                &imem_sec,
+                &dmem,
+                firmware_dma.dma_address(),
+                data_dma_base,
+            )
         };
 
         Ok(Self {
@@ -204,7 +147,7 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
         falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma()))
                 .ok_or(EINVAL)?,
             |v| {
                 v.with_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index c4f436104326..f769b2b277c0 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -12,7 +12,8 @@
         TryIntoBounded, //
     },
     prelude::*,
-    ptr::Alignable, //
+    ptr::Alignable,
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -20,6 +21,7 @@
         self,
         gsp::Gsp,
         Falcon,
+        FalconDmaLoadTarget,
         FalconPioImemLoadTarget, //
     },
     firmware::tlv::{
@@ -30,6 +32,96 @@
     num::FromSafeCast, //
 };
 
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    sec_code_off: u32,
+    /// Size of the secure code part.
+    sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    argv: u32,
+}
+
+impl BootloaderDmemDescV2 {
+    /// Context DMA slot through which the bootloader reads the image: physical, non-coherent
+    /// system memory.
+    const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
+
+    /// Creates the descriptor of an image whose code is at `code_dma_base` and whose data is at
+    /// `data_dma_base`.
+    ///
+    /// `imem_ns` and `imem_sec` locate the non-secure and secure code in the image, and `dmem`
+    /// gives the size of its data. The code DMA object must be a mirror image of the target IMEM
+    /// layout, because the bootloader uses the destination offset of each code segment as its
+    /// source offset too.
+    pub(crate) fn new(
+        imem_ns: &FalconDmaLoadTarget,
+        imem_sec: &FalconDmaLoadTarget,
+        dmem: &FalconDmaLoadTarget,
+        code_dma_base: u64,
+        data_dma_base: u64,
+    ) -> Self {
+        Self {
+            reserved: [0; 4],
+            signature: [0; 4],
+            ctx_dma: Self::FALCON_DMAIDX_PHYS_SYS_NCOH,
+            code_dma_base,
+            non_sec_code_off: imem_ns.dst_start,
+            non_sec_code_size: imem_ns.len,
+            sec_code_off: imem_sec.dst_start,
+            sec_code_size: imem_sec.len,
+            code_entry_point: 0,
+            data_dma_base,
+            data_size: dmem.len,
+            argc: 0,
+            argv: 0,
+        }
+    }
+
+    /// Returns the context DMA slot through which the bootloader reads the image.
+    pub(crate) fn ctx_dma(&self) -> u32 {
+        self.ctx_dma
+    }
+}
+
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and its IMEM load parameters.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.

-- 
2.56.0

