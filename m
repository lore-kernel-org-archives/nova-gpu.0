Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948797;
	b=d9Ug8MuBdkK5/0WX0ZVhPj5HjqStzAvtW+LGgUj4TYkd90iFIqoWRk6pooUKXhzk9kEx
	 iqnHcX+N+A5eY4t9cZ6xJTYUfssuqZGeRjgzK7tzH26UikCgpra6H1PCZxqTrSPfAQhsc
	 P0O8VE40qPk9St0Gebw7zmetcvQ8do0u1GkMd9wKsm+OAlbSFeAojF7i4fHK76AwFOrfL
	 JCH9g2s6Cq67JbR65UKxqsMfY6J+dly2GwQS/Tnp/d5Idqj9H3VujxDJtGFk6vLPALLiD
	 R+fFWAUEjudkvshm7BXzx7wW2D6SqYrBdNBh8GoRdZq6HtGA1oAfLyJtwENe9UURpWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948797;
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
	bh=cRhGQj7LKCHIbdszlIcDRrqfoz/GdOOcJZ0AQoCUtyM=;
	b=P59CzCZD0ctd+TaoI2ECSOj6X3ll2Kr04Ev1tgiIY9c1lXIo1fRODCMy5DBeQeKIPdfD
	 o3wnvdS2oHpDYUrwUgBKFhRK7mpjcPOav9YUNBFaYvYSaQ8VuV3ALgHiF97eUqSRrNrec
	 W7ENUXo43OUzkwBpvPHi/6C0QFULbXywUCJ+yLhLqO3QEzEjgvSjO0dt0cwzVOHSgoHwL
	 9aMfCwE4SKkLnWqb//f+EU+rQzXNtba1XgVSrw7i5modNVo2ZWnZVZK6ykUCZAuT9MEbL
	 A9psspQojbOZGwtBWBpyGW+69EDaTT49SQmzcPnJA+hGjwn8jgLkznkuqa55+7Moh5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ABkV4jDa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AE606A32E
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552AE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ABkV4jDa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrBD18MZ0PVb4bN4bKE1tmjDmgxz4mSa15QrSMdFeICaVdDjKoWA3gUxhPtvY1qiFvSqzB2HSNSx7183NNBXtsbaz33KS7/Z+0uwg5Di4irkfOC+TFi/m1VhQVFzQ6HTzNmUrtwTNLler1OO8lwb1owlaxvOHBDgTjNTE3ieNe/D7jUy7BfxwjIjwOWxfs8YX45S4V0yFQR5y6Uta/Zert5D1IOldWg50f+UsNBUaCqxqJ1bM1VEKTvcQ9/ai3mNTVIZONdcY5nx3WC3En+qcDkCqeJxzf4mtNU0e/3k9VxTs+VhksQBax5p3zI0jF2Ar0QAj3wW04tMDACXIe/0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRhGQj7LKCHIbdszlIcDRrqfoz/GdOOcJZ0AQoCUtyM=;
 b=IIvgm1H7JQrW5FC/iW5lWXWCSDajjt1GYkd++BNPhxKoX4puojPuJEE32oiRnB1TKjHFB+8WVkyPSb++edQysEHg/x8+tTqUsep3J3FMUuiqcD4cM0wkthxI1fL5pr7Scu/sFeSIsTNT3OfBIhm0yVqrfwYqE2OLe3iEeY6pqxAt/sWhnXW222RfDSZWUlMmWTwQt+WoSCahHhsooshlKUJ1ZKCrldOynsCF1g2fIOwSaG1+/plr8JImJoqTck0xEZZTL/SuyAzrloal3TMEqJw1dMzhQuhpRZMqKM+oLciGZCrtGNZd0p0ntu/0YnZFJ6NXDQQ8usJSkra4sDYWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRhGQj7LKCHIbdszlIcDRrqfoz/GdOOcJZ0AQoCUtyM=;
 b=ABkV4jDaxsja4vdtOtdN+Vp9okMD17EqgEfrtUF544Wb2Ua7f2/LG6t7TAyg61CtPCcAkyuVqDrNlmimL8nTpEOVWTqHemp1H0PE65WIR8eVvAfaOXGHwijSp+SRGnGxVdJsZjTQsFDWh+MWHwMgzhKuCh0T89I/Z0E2/yjMR1bmIFFl4JVXRT920sT3fhWSIQicRXVB6bfMU+jrQsp5xM8Ru1+yrCJD6mqXx4pR+cDkNcRgFABSJc9DaePs2bGyLCxrsTQxo0B5iKjlAkhomtxv3BMmkKFXblNGIQUTlCbN5XaKEKc8dWHXonpLxxv7AcGnUFvLsCLGWs6QjwU8GA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:29 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:13 +0900
Subject: [PATCH v2 5/6] gpu: nova-core: gsp: cmdq: do not use ENOMSG to
 skip messages
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-5-e481ea2168ef@nvidia.com>
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9a77a6-6dce-4454-e440-08df3bd47b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|11063799006|56012099006|261021123027099003|261021135927099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YIwQSbS1hol6+d5AFgAC25aV3GZKTagrlxzmjJRLk6+7VeDHh5H8KXqJbaApViSUps1MtZFuGJ5omnUJmCzkKgkUG94AXLwDh9P79riebwbGBa2pYE8UxeNramsabnh3LMoaTh0z62MFndKUfkxp0B0/QW7zb6dE9rxudDu0zi9JbcWDYAaLfcJx7U2Un/89aJ22OvC4zNFJfV88qx7oXjoRjqz2Q9yEnhcV9GNnPIvY5RMLBLl614UsQyTF0tYbltZKoS3XU+87Wbd3/A6Ka0b/G2Ilco/fBKyP3IG2mg8sdpTkx5Fb1ynO8m0DofDAJB4vMXj1mtn9EQd/z+9XDMz8OCmIXmsHXDSXehrE3vJy2TEtGyhx5V0AoNOAFoU6p08qBy20X9PLR6mdMJUYJ5wSDJLUx02niO13vo97ovSq/Bv+8C3vgbPyEDMeXnGX15kMXVTtB8HkNNt+HK1p5OjSirCpaMenIpA8I0Tamyhh3zJUisq9GEOZr0aEDz5/uR+bkgFdq5tAV3aHbFN8DFps22OfNTqzt1di0wLUVzya1R+bqyQmKpWs++kRn5GgHz+2kJsBH2Ec+ys5CZEQFWEYtdjuRWzD/ccYgd7Fdxvo2LZMefg6t1rscmh7CzxM7Sl66+oJnlL+CihvEa1SNkadyPfKqIHGcz7G+CH8CWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkRDTnUzdXVRN3BRUVhEQnZDRUhaZ3Bsb25aWGpvVW52ZHN4QU5rS2ZpN0tX?=
 =?utf-8?B?Wm15b1pZRWdhSHFzUC9QbXpYcUxVNkRtTG9PVTFub0RIajVBMFFnVGh1Tmxz?=
 =?utf-8?B?Z1JhZHFFTVlJMXd6Wkh3NFZyWlVGSTVhdzlrWnJEK2crS0Zmay9aMkNKcTF1?=
 =?utf-8?B?WjdEbGhmS05NaGE1RGlXbjBra0hEU0RmSXZXMVFaQjhNUUZlZTJoNHhtL0RW?=
 =?utf-8?B?NW1TbjVHRUtxRnMvVVBmL05nSTdweTNzTUpjZkNnT3pZckoxdEJtbnVzVWJl?=
 =?utf-8?B?elZPbWVzQ1VwMjhtakhUK1hKTnZKRDBIbDZac3dNOW14RkVrcVZSaXFVQWd3?=
 =?utf-8?B?YzVvelFKVDd1NjdUbDhQNTFmYi8xUUp5a3NSZjFzcy81dkpXMXBPSlZweW9m?=
 =?utf-8?B?SjhkKzNhQzRCb0hoZXYwSGlSL0ZmN1BHYU9qOHpFUzA0dEIxN1htODlvdEpM?=
 =?utf-8?B?ak14ZGVNcnF1NXF6NjlpM3NLR01YR1BqN29PTTREUlRtODIwVFdxZ3lJdDBk?=
 =?utf-8?B?V2krNHpMNlBqN25GMkNpSTJzT2djZjQxU1JXNWYxcXNOSGNldFNoOTVWSit4?=
 =?utf-8?B?Zy9iRWhqTWJrcS9HRVg2NWxMVjJRUmJtWTUzdVVBUjdQTUZCa25EaWp4VDhz?=
 =?utf-8?B?ZGJzSkRybEN4WE10TS9sUjJsUFd4S0psV1ZnWmVYcVZyeU9YZVdBRVRNc1M1?=
 =?utf-8?B?YWVScDNLYUVBL3Awa0l2M29XeFhzdUV0ZE9wbGIwWk96Q1JINkxwR3lZTDQ1?=
 =?utf-8?B?RW5HVGlsa2MxRnpsOGREcFFsb3N1LzdLOXF4V245YVJqYTVjSHR2b3IzcklB?=
 =?utf-8?B?RGxKU1hkMVBlT0c2SGx5bVhLR0lMNzZjb21QUmZvbU9YekpDM3NMYVh2SXh3?=
 =?utf-8?B?ZlpNR1ZtNW9iVjlRRkw4VS9VY2M0YW5CenJTczJZZUJiTG5kekdCSmVtVGxi?=
 =?utf-8?B?Qi9acGRwSnBxYkNISjdRVkZPUjZDMUJZVmo4M1NiaWdyVDR0bDFmWFU0MmZs?=
 =?utf-8?B?MytKbEU2MUhpUExORVo3ajlVZ3EySUNjSENZZjJMR3QweHI1THo5dW5xSTJh?=
 =?utf-8?B?TnlzNHhTQ1VOblA5SlQ4T2lKWndBK2V5RStSOHFEeGpmZU5kcHdtWU91NEpU?=
 =?utf-8?B?NWFvaloyVzdyNVU3TmZTNTViU3FjUGlpOS9maG5nNjF5dzB0V0UzYzZCVERS?=
 =?utf-8?B?UWNLSUNCanpRb3doTlhXYVFjRmhqQmpTRlFqR0JGTTloRmNRS1BhaEE3ZTlt?=
 =?utf-8?B?ejVEVVluZWFPVEJNcW5sVXJ5b0NHV1RkaGRMWmNKM3VMTnhsNnFlRGxJR3pp?=
 =?utf-8?B?YU8yUU05M2l6SVIrSWZVSS9wcmdzSG9ONTlHRUJlMGpDYkZ0RTl6TVpVY0pV?=
 =?utf-8?B?MUZXZ3NkQ2tPU05yR2xXNWJNU1ZFUGFHVmJmeUx0elYremxUcUNkSFRBOWtt?=
 =?utf-8?B?aGJqcVkxSjdWOUJVQ1NiUDVUSHlGeS9ieVhxeUtDbUwxMW96Q3FkUnJlY2tE?=
 =?utf-8?B?bU0xby84Z1VXVmVaNDJRWnJwUDJLTmZRbTNhS0RTQTdYWVJMWWFZMlZYSEZq?=
 =?utf-8?B?MlFIZE5Ecjd2cGNpSFp5ZlBuT3lLNWM0ZlFyMEQrcG1hOU8waVFtM252SkFO?=
 =?utf-8?B?ekg5U0crUUNhODFsZ3BWeDhydWs5YVpkL2FqMmM0RlV3d0E1OWtxQXVjaWZu?=
 =?utf-8?B?RDI4Um9IV3pmeEQ4WVBEajZETFBHMzZkeURJVDA1bzZsbVBuL1FlNEpaRDBT?=
 =?utf-8?B?dnRleGxOejM3d1Y3bC8yM29lcGJvMFZDeFc0ZWQvdDA0NGFVQVg4Rmd4LzR5?=
 =?utf-8?B?b1lBcEZ4TUd6SHRkUnZyclc2MWlQcUFwQk9iV0x0VjB3UXB1WU5VR2dkcGRz?=
 =?utf-8?B?SWw1Vnphdk9HakIvbUFnaHl1K3k5SzVBREZxcWJsY0VDVFNqZFM3Y2dFTWFN?=
 =?utf-8?B?c080VFRmZ28zdTVVVS80L2NYazFicE1ZTm5TTFRMYTN2eUhrcmhpZ3lnb1Jy?=
 =?utf-8?B?bFFpajBGMnFaTGVudEhoV2dYdGZKNXAwQWI5Z1lsanRWWUJkZFVPSWIrWEhW?=
 =?utf-8?B?SXk5ZVczSi9Zc3JEaDkvdmhqc1VoODY5S1AwSUhJV1dqOG9IQ29acDRMcUpY?=
 =?utf-8?B?UlVqQkd4RkhuaVJVTmpaVVg0K1o1NlhMckVZb1NRcE9VeVBDSnZxTXJ4bzJj?=
 =?utf-8?B?MWhWRzM4SDErN3NKWUkzWGx4RXNsVzJSaXNEV0o1LzhKVG5zS0pJTlhhTUd5?=
 =?utf-8?B?ZXBHSFR2b2ZsdnY1TmdaUWlMUEo0VDdoZlAxOFRiQ3FOTkxCOUt6cElnVlBQ?=
 =?utf-8?B?UWVkRUNvUWZxTFdNYy8rbGI4SFpRK0JuSHhTZHpjSjRFRlJhWVh6bklUSlRr?=
 =?utf-8?Q?yXmU06rOFfR1wDdrcCo2/q4noe8DebhjHFW535bK8jK3H?=
X-MS-Exchange-AntiSpam-MessageData-1: GJKfKFVqbjMN2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a77a6-6dce-4454-e440-08df3bd47b14
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:29.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1kmTUUzkAgRhuN7F7XGNLyesbfvvQ0FE4rRBDOLEEvQguFXt1sMpCrbc7fVOSTZ07Ar2X+d/5RiNMCZYsgePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

`await_msg_with` currently relies on its closure returning `ENOMSG` to
signal that the message it received is not the one it was waiting for,
and that it should be dropped. This makes `ENOMSG` an in-band control
signal, as code running inside the closure that returns `ENOMSG` for an
unrelated reason makes the queue skip the message instead of reporting
the error.

Make the closure return `Result<Option<R>>` instead, with `Ok(None)`
meaning that the message is to be dropped. Errors returned by the
closure are now always propagated to the caller, so no error code from
the closure can alter the control flow of the command queue.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 19 ++++++++++---------
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs |  5 +++--
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f3151aa8ea26..e6a46c5b5160 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -676,27 +676,28 @@ fn consume_element<R>(
     ///
     /// The message is waited for up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
-    /// `f` is expected to return `Ok` with the result to return to the caller, and `Err(ENOMSG)` to
-    /// signal that the received message was not the one expected (such messages are dropped). Any
-    /// other error returned by `f` is propagated to the caller.
+    /// `f` is expected to return `Ok(Some(_))` with the result to return to the caller, and
+    /// `Ok(None)` to signal that the received message was not the one expected (such messages are
+    /// dropped). Errors returned by `f` are propagated to the caller.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if no message satisfying `f` arrives before the deadline, however many other
     ///   messages arrive while waiting.
     /// - `EIO` if a message fails framing or checksum validation.
-    /// - Any error returned by `f` with the exception of `ENOMSG`.
-    fn await_msg_with<R>(&mut self, f: impl Fn(GspParsedMessage<'_>) -> Result<R>) -> Result<R> {
+    /// - Any error returned by `f`.
+    fn await_msg_with<R>(
+        &mut self,
+        f: impl Fn(GspParsedMessage<'_>) -> Result<Option<R>>,
+    ) -> Result<R> {
         let deadline = Instant::<Monotonic>::now() + Cmdq::RECEIVE_TIMEOUT;
         loop {
             let remaining = deadline - Instant::<Monotonic>::now();
             if remaining.is_negative() {
                 break Err(ETIMEDOUT);
             }
-            match self.consume_element(remaining, &f)? {
-                Ok(m) => break Ok(m),
-                Err(ENOMSG) => continue,
-                Err(e) => break Err(e),
+            if let Some(m) = self.consume_element(remaining, &f)?? {
+                break Ok(m);
             }
         }
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
index 6ee28e93586b..d01a9f4f953d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
@@ -377,7 +377,7 @@ fn await_rpc_msg<M: MessageFromGsp>(&mut self) -> Result<M>
                 let mut sbuffer = SBufferIter::new_reader([contents_1, rpc_message.contents.1]);
 
                 M::read(cmd, &mut sbuffer)
-                    .map_err(|e| e.into())
+                    .map_err(Error::from)
                     .inspect(|_| {
                         if !sbuffer.is_empty() {
                             dev_warn!(
@@ -387,10 +387,11 @@ fn await_rpc_msg<M: MessageFromGsp>(&mut self) -> Result<M>
                             );
                         }
                     })
+                    .map(Some)
             } else {
                 rpc_message.log(self.dev);
 
-                Err(ENOMSG)
+                Ok(None)
             }
         };
 

-- 
2.56.0

