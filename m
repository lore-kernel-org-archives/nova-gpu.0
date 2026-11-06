Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948782;
	b=NXCfsFozdtm0nD9SIda+dUxsFTq52j/w4FnI/q4QlCA4w1lxzmhgqFdm/GsXgM0v2Mip
	 xJcHTe27zNYnV9GbnC2Rl//uQWsMHAvL1YgMrw5TEtH1gZfKKhvXTa06clnQ+ZM0ZW4r+
	 gpOYxJ/N0BWqBX/sHeLR4feLMbxh6wsVdAUJaA4NZkv6w7OcfshZjmrxBopt7exmt772B
	 TX01zD/ZdSMqLqEM/su9eNFNIniNdw72h6bFis6zR7maXmDNlAODd2+QgOKA+IQARz9RY
	 hCoIg5RDdZh4fLC/SFqLhy/yLPAbDlnXX0hHnlv2Z4dZ2ijWN1C9UrTB17iP2JydnkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948782;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=wsTbxh0T7C91/vVcplDXEbsDTHJRV6cg3ZypzzeY7v0=;
	b=UeA11gZDZM8zRZHDQbS7k9hdK4GX8w7xnVADaZWP3KApcF9gI2H9NNYk4cafnWMhg+D6
	 8CkemWHk4bVlhXV7W1eUMaQf037S9K/xbYEHEBV2cIxuzmAdiGLlg8eW+cXw2JGoRYC50
	 GZUR20c4oSyTTCQBq8QrDb3Es3XWmZG7LepFzLP+VUmtjKqCVtjHt8k9O2AWg4YsMf2P/
	 O+6qIuuNLHORUvzQ2edLPIM3IzDwWaOqebWDG6Rr8qOIzPRRi6DEePbbbm+ajQGBs4EpF
	 S+Q9eln8DY0SMNS3CdsOcoy3u2soJtkdxk7TbBX1i+xocdqMbMWkK8iV0MzVouC4Fsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YsSqDc7M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.6
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A94606A32F
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A94606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YsSqDc7M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ0hQlwhdVyxWiJ5NxE+LdXDTXxHwzbFthcoH7AdytKJfB2wkR6i5JAD1RVqAbqEBelq/5KV6jbIrVV1Q9s08MA9eeNcfpAzBV9iy2zEfemDF3dS8vozAsq2TbfJ1ddXdPEk+SeshooVI4v8jdnpZn3XgB2eefmihvB6la6uN0m+uQvBGvkl5T5+tH1MiV78FLQzzl4ZrjeQsKPfGt7cvSEnjzCMSQ5S0UYZEWvqFUCC3fWRI5RTxiDhS28sZeFurajpn4yx0wZvbRF18jX4s7op3mq6IEGEWCT3LhUjkbayULc6mi+wxj9eW5bfOUbOLnRsdCIqdjQiI4fpY4rwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsTbxh0T7C91/vVcplDXEbsDTHJRV6cg3ZypzzeY7v0=;
 b=Qik5npP9CDVai+YiOvPcYTXsNcdKNwsmCkrK1NpQtpFGyA9fzNV8xUwSzFoucuDcW0G6N4jS2HzljUUm/3VT2apIbrxj8RZrVGQzkSQK5Z+FGrmrBy47dXo+nyNvFy98BsGgeD/TM/BmKkScttBszVuYaTCNVt4oNw60NKKLS5OwtKLdpn7vPqHUorDxlL/p66QpyaL3I8x/ecPurwG6gsFl37nHiENIr9Dc4pHsViyMNwATlyiFAvoBq3nFPDsFgxmOwpEffpjhZaoPmXjzEQwqj9cT/m5qJAb3DCv+RpBFNA31+UYz/5gv8zuanivYDmQWXq1oOcLVVXOQ1fblRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsTbxh0T7C91/vVcplDXEbsDTHJRV6cg3ZypzzeY7v0=;
 b=YsSqDc7McGTjJ9ZZxVn/bgWjJ/JFmiwXYa7JyDMrYP3chWA/TC+5VaAPAFg8SOjKVQ54wb4aUZiqenJpwRz1XEX5Izc9fOt5gGZgMuVhnuaUdsKJeawqyGnoZXkiWNQ/iH7Xnwkccmh0xoBpWs8vg1kTw2M0jGSIEvosr4BP0g3bq7RjjDcoTBiC7okXxA0VASAJm+EEr4kmUyeLYe2sE7QGEitrbbLthQXPDWKd7r0LXDiDnPQv9oF6EtkpPGP3GJNQ9vB4ky9B9RtdIshcs4Usx2elHJ1ZZ9prKAWayxQuxk7IPB1y+PYJ8uc5kPxwBF/8vKAp+WhPkpYJXYAgHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:15 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/6] gpu: nova-core: gsp: add support for GMC messages
Date: Fri, 06 Nov 2026 16:06:08 +0900
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBAFf0Vybsomgpie+h9FJCabugWTNrGhR
 fz3Rj33OPDezMISRsLELtXCImZKFHwBeaqYGbW/IydbmEmQjYAaeASAPuKgE/bB92ayLx6fhku
 lwCqpGt06Vt7PiI4+u/nWHZzewwPNvOm2xUhpDvG7p7PYdkelZP5WsuDARauccq4enJVXn8mSP
 pswsW5d1x9xmrTg0QAAAA==
X-Change-ID: 20261030-r000_rebase_on_cmdq-rpc-2990d9296a8f
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 849c23e7-652d-49c6-0ca1-08df3bd4726d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|261022075727099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|6133799003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cCm3kJhCP5lrAHLyJScwrzVrb3OuQ1ZjcreuHnltLSfKutb/R6iH+HfTgHB+0Q84Xlc9x++EMeVOvIpEjUI/B0CQSxFiX2nylYUaVgDQoFf1JyIV7FzKzb3I64sa68IskQcqG44wbQpMOU16JVSCAuBjW5NTlIyMQdLJkcCrlwnFuk/Hg3Q+Blc3LuGS3WtvZAWAInfHFe2M55v0Gvg5+PMY3nu7ThxaF1/r5QHN71pTqx1xHR51PnN+K8ceFJytvTteDQUWdvoNbXf25wDgpq9GjrpVY82g4sNqG6gDeBbv+t7G/ovbS7X/Dem9/E1Mx0Zvbi4R2WUA/KGnW1nYSAPDV8EYM2m2I5BR3ExZD7G/7KEESihbGN6sj7crd28ZqoAViWI/q4IECF2tb8m7xUGSaw/P8tObveCJF5xdPo19soTIP2EKW04kv/Q8NC3r7MzzjYKNGkW9crhHp3CnheLnpDKlO0f0bYyoRHEiqGYFfL4KH9BoGwj81m4ABF1otcmy2r+z4c9VrXJXwckmUJAQxnulRSjlf+kZIB0NU7jE38/OB9wn9rnrtj9iqjhb2TFwZV++x90S5LdaGgcB6BP3hb1lUy4eBwQeXB2ed0kcMm5T/S+fwmww6x93fr3bx+/e3H1S10kGsl2VBEm6a1/ZLEnOZsbcQ54pIiQhuik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(261022075727099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(6133799003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFBSd2k0c0xUUkdpWElOb1Q2WVpWTjBVcUZKQlFUV3hHRXMvZU9DazN0UWxB?=
 =?utf-8?B?Kzg5UEdoUEJ1ektMckxoanlieFlvMHdBQWVCdHk3NGNFVkVwVi9vQ0RzWjNh?=
 =?utf-8?B?emhnUDVFbHRLS1QxUklEQkwxMWVNaHU2Z2ZJZlFkS3BqaDBxang2T2FZZTBC?=
 =?utf-8?B?ZitvSVpkTXAxdndOTC9vUGtpZ1ZrNGxlZ00zNThrUzhtMTNWNGdPWXdsK1Zr?=
 =?utf-8?B?QkNUeFlQTW5DMjZRMWpDSHZ3T3VQVUwzbExVeW51L3llS2hCK21CWkRoRDBV?=
 =?utf-8?B?VHNqMjR1N214Sis2YjRkWkZKZm05T3ZFd0d5bndkd3h6VnhMV0k5bUhlZlJS?=
 =?utf-8?B?R1htb3FNS1NMMmphY0RPMTBiMzFFR1BYTFpFVzRlOTBsa1JyQmhZWE13MFk1?=
 =?utf-8?B?cnVmNXpVSDA4bHA3bGlwWXBoZFFpZlc0cFVOSFowbzdUSlFaa3o3SnJzZlJ2?=
 =?utf-8?B?Z01qaUxvNE56UVBEWGY0RXJ1ei9iVE1rN1lDQ3dzY2NGeUlneTZiM0phRHRz?=
 =?utf-8?B?UEFRcElkcVF4dm0zakdaaW5wdWN3RUR3aU5Xa3BHWnZPYk9QWTZ2Z3NsdGJI?=
 =?utf-8?B?RUp4b0x2ZXZLWHVLWEZXRzc1YUVqaTNod1ZRV1huelhxd1QzbkQ0Z2w5MGJq?=
 =?utf-8?B?dUZSTjNydzJFWnlRQmdCd053YkVZUWY0WldGRHdURVdyaTRqdEJveDRNeFB3?=
 =?utf-8?B?aTZKK2VXdzBqVDQwWDdRZTlvV09yeEtZS1BvRnhVdTF1VzVraHd0Z1ZPVE90?=
 =?utf-8?B?YkpUNGRGUkNyazczY2M2TjN1OVZDbHF4bkVNWTk0TGprT092bWdMUld1c05i?=
 =?utf-8?B?VjlJQ21XNStobXVXU3E2UWc1aTRyTlhSemVOc3JUQkJ5MWs3Mlo2Q2ZmRWxk?=
 =?utf-8?B?WGZ6WFdNMkYrb0lPUG9ldWFsc2NEVWs1cWhaZUVIT2NrckJROTkxOXN5TTd3?=
 =?utf-8?B?VHdSZ3hKMzR6NWxhckFwOUJHNkZscFJwNW5vWGRjZkRBbTJhZUJRU3hJNU92?=
 =?utf-8?B?N0lWS3U3VzRxVkVKa1EzSlhod1M1VHZ3S0N4Mk5VNitnVmF2Sll5dTFkVGl2?=
 =?utf-8?B?RUZlYlk3Qm9uaExMWFVMemUvZlhoQ3F4dDZCVmtVbVFXM29za2dIbDM5RUpQ?=
 =?utf-8?B?dnlTTkdvelRCekxPZDlFSDZuL21TK0hhNWszUmZadzBDcHBrL0N0VVM5UUw3?=
 =?utf-8?B?N3NYV2xlV29mZlNNYmRkV3lxOE9naklVeEJVc2tIak8yNjZRV1pmL0MxQ1Bq?=
 =?utf-8?B?d3NMMnRWL0FnRUR4dm1MQjV4UGNZc1g5MEFQU3E0T2tmbmU0ZDM0SmhYRnVT?=
 =?utf-8?B?UFFocEpTNDFMYlNrVGw5N1N3a0ZFa0JwSkFxQUl1eGJEMW16R2xUN1luNlIz?=
 =?utf-8?B?SWtvdXMyTExBNVBuUCtGbTNoemJnVjNHSjNUWlA4dG5PYkIwT2tXVDV6UXQ3?=
 =?utf-8?B?bU9RY2llMWp0ZTN3SWNCbGZra2NsN09UeEUxUVhyZWE2YnFvRXE5c25GTDQ5?=
 =?utf-8?B?ZFdGdHgyQXRDYUkrd3ZEdFBiMDIvNUZaSkVCK29LZVo3MWU2WTFoK3kxVW9O?=
 =?utf-8?B?bGhGN0ZNZnRJdmY5NXFRS2MyZE0rL3c4eHpsZW1UVTRHNTYzaDlxeW9lVjdK?=
 =?utf-8?B?SHRIcFFKYzFjRFU2ZDkrSWQ1TmNhTHBZV1lKY0wvYjJWTXQ1aWRqNW52L0E0?=
 =?utf-8?B?cDYrdnVGRmtid2tEUnIrNVlOb1lRUHFUQ2pQRW4vam5wWWpLUnBzcy9Fa3Ir?=
 =?utf-8?B?L1VZMlI0ZHJzVUpZV0t0MklhaHI5NUxLclV0YnRlQkZyQTlCQklzT1NVdER3?=
 =?utf-8?B?aUZONEpFeHo3bVlQSjkyNDVWVlZPRlovNGdpcWVHTU5JNEZFUWtZdFoxN0Vp?=
 =?utf-8?B?d2pTYTgwc1RIcnBUYkxVUTVabE9PN0hmUjRNV3QwYnZITlNUZzIxT1h5V1Iw?=
 =?utf-8?B?SWY2NXA2N0Zjbk9sREpndlFrNXZjRHdxR3k1Zk92d1NYWGNYeFUzYjB3bTFj?=
 =?utf-8?B?Z01TRkZ2SjF6YUJELzVtUlF1TExrdENSNS9lTFNIU2ZRQ3BoWXNHMWRyYTBs?=
 =?utf-8?B?SXpQV2hwN1pncHBhQndnSE1uTi9Nakx2clpOczdZc0drV2tBaDU5Qmt6bEdz?=
 =?utf-8?B?WFljZ3hkaU5kQjRmTEtUdUhjc0c5Y09kNW5HcTVIR1NXUTEyVGJKQWErYzZt?=
 =?utf-8?B?YnNaNzNHWXBCL0czcjRPeGs2ekdML3FmV3FFaVc0b0k4ME10WVA1anpON1k2?=
 =?utf-8?B?MXFUZVRUMVo1NzRDODhtVUNXUGV2R2pNWHZjVEc5SmYxbmpMdE1pclZlQTRY?=
 =?utf-8?B?dmV3VkhQVlVGSjEyM0I3K1pXWTFiNkpNanRYaTNySVNtWWYvNDFmaURiR1ht?=
 =?utf-8?Q?qPf5BJNiSyjuyJZR8giRGA0KPFQ323A6c1GjSba4VKrWR?=
X-MS-Exchange-AntiSpam-MessageData-1: aXm1ioJa+T5hIw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849c23e7-652d-49c6-0ca1-08df3bd4726d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:15.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgYfzID6oVuRPd7FIYA6d+bGM91SVjIAHIKwlCYMN65qFyU1dQGgrqdDnazNPMxhJL6x2vsoF8WlqzEwaExuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

This series contains patches 9 to 12 from John's r000 series v3 [1],
that add support for the GMC GSP message protocol. This code is rebased
on and adapted to the latest `drm-rust-next`, which clearly separates
the transport and message layers of the GSP command queue code. As a
result, this extracted series should be both smaller and easier to
review.

GMC is a new message type with its own header, used by the r000 firmware
for its boot protocol and newer interfaces.

No functional change is introduced by this series. The newly added code
remains dormant until the switch to r000 takes effect.

This series is based on `drm-rust-next`.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Remove `Assisted-by: LLM` tags.
- Fix build with rustc 1.85. (Eliot)
- Mention that zero-length messages can be either for no reply or empty
  reply scenario. (Eliot)
- Do not use `super::` for imports when unneeded. (Eliot)
- Use `split_at_checked` for message parsing and factor out duplicate
  code between RPC and GMC into a helper. (Eliot)
- Remove `MessageFromGsp::COMMAND`. (Eliot)
- Add `const_assert`s to validate that messages do not cross the page
  boundary. (Eliot)
- Rename `is_reply_to` into `reply_status`. (Eliot)
- Fix stale doclink. (Eliot)
- Log unexpected responses instead of passing them to event handler. (Eliot)
- Change `await_msg_with` so it stops using `ENOMSG` as a control flow
  signal. (Eliot)
- Separate GSP-RM command failures from transport errors in the GMC
  reply path. (Eliot)
- Link to v1: https://patch.msgid.link/20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com

Changes since John's v3:
- Rebase on top of `drm-rust-next`.
- Use same message type abstractions as the RPC message type.
- Simplify comments and code where relevant.
- Make `GmcApiHeader` wrap the bindings type instead of reproducing it.

---
Alexandre Courbot (2):
      gpu: nova-core: gsp: cmdq: move message trimming into its own function
      gpu: nova-core: gsp: cmdq: do not use ENOMSG to skip messages

John Hubbard (4):
      gpu: nova-core: gsp: fw: add the r000 bindings for the GMC API header
      gpu: nova-core: gsp: add the GMC API header
      gpu: nova-core: gsp: cmdq: add the GMC send path
      gpu: nova-core: gsp: cmdq: add the GMC receive path

 drivers/gpu/nova-core/gsp/cmdq.rs                |  51 ++-
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs            | 434 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs            |  33 +-
 drivers/gpu/nova-core/gsp/fw.rs                  | 107 ++++++
 drivers/gpu/nova-core/gsp/fw/r000_00.rs          |  29 ++
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 110 ++++++
 6 files changed, 733 insertions(+), 31 deletions(-)
---
base-commit: 7a6bc132f1b51437063c9203e7221067b40a791e
change-id: 20261030-r000_rebase_on_cmdq-rpc-2990d9296a8f

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

