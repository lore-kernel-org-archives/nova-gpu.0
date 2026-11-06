Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948798;
	b=iBrSJQfhEceSGtnAGiPJ73GikKuJG1fkkefDwt8zxnRBeYNv2Nb+NcLq0Wap/ZJqnuEb
	 ENuUXR2qES/41Wc+r1ERL6sW8vSB3mkyQstAniiD0+lMJcmN6Pktf05QJDnqpE92v5WOp
	 Naa9tmYh7sU+2IkE+iDJkx5gLx31aFhUx6PBakQOZoGjXQDmuHEcFaffDHxlnPzRnpczv
	 4dtVpEUezVCnegyqbgzk/qkxnAcanhEzsVEwkAP4MJ+k4aoru91J1YTbgYwRoCVHyWEKp
	 PqR1d0cTAOLDnNUQQb9+dqJhwZrjvK9Rd6X3NNMt0LXGo9RBMEHN+jkFI20VO/sAnCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948798;
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
	bh=alAwQeLWydmd33JwvWAL+zeRu/MUC/dSmYPTpr3ak2g=;
	b=fPOXg5QBPeOtrdrZGM9Qs75e3/HRiIZO3kp2PNV7dnpqp0hO0OAXQB2LqAcl52QGFb4v
	 Vcpxge+CVV3mNrosZX7R9vOgKVtIQ+rFfCtOICgY3OzGxyJxEpZA3/F1HklZzHPYk6x/g
	 LWI/cAZw9JzjDChjhALKmD2+QeCRLPjG/6oJuUY1riUdnCJwON1n/fgPDiSzE35HVrW5U
	 nS5Ygs+G+Bb0EyhJqFPpN1fHT2fAfCcMGUuCr1cTxXRWEIHS0XKmIHeNdQCRDsmKg/7VB
	 fjSNuwp9JY93uvGrWEtY+GJJcXGCDI4BMPKuzJNLeBZjG/+S5xze0QuwLruiivdC0dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovXh6QCr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.31
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B5606A32F
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036B5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ovXh6QCr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv9Dc2Raun2Z60J66WK7y+ZJZloqMDu3z3OiH64P2WQ/npbBkNczL/bkhJ7a0yI7FtTeJ5IaxnfGDungKrl1KJ/oIjSKyJk5uWiaM7jPjNn/n7DkINtiysXpRJIacDMVKq0K56zZyBmxx4N0q9AgAv3xxdttatbPIb9Oou3E2zXKoSpaNk3FhCteqDehsUzzstAuLz5DTbBM4crYkRpPH25ns6PwJ2dsVbsdvJv0pzHebkxySYEg7tV2Sq4lVacHaLBMiEx7JbnG3nN6XJmja9AsoP/oAeMqRUNTyEqAzNHP6LEcjSkdL95JcIcvfU9lS+f6nJTdelI2hiZA3wyuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alAwQeLWydmd33JwvWAL+zeRu/MUC/dSmYPTpr3ak2g=;
 b=SzbFSnD/NS/l3uSew+YUk7aawVqVA6FUaXortFrA0WxhjlJfxbFDjZeQI0eGWsBBhheNqf50xeiJSz43ATN3UTnCWkALjEzYQ2H85wMHVsWIOymZVDkKo6axsVfxihZobv01E+lzsB0cYxYKtAnHG/W4DxBs1+JTD0gplpYixsqPWpsGM9PF1taMq0jVBTIgxMrEOwydJSgvaEFkiMq2YC64K0xQyHjsBPHY9jl6OSevgzng+5zkhHNAYhJ2c0Endn3MwZkD2WpLAJTj6W4Ikd82T073ZDvLZqo53pC6Cc/cvsIaJhuAWRH4tFBt80DUGY17llT70nI8VJ2iyi8zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alAwQeLWydmd33JwvWAL+zeRu/MUC/dSmYPTpr3ak2g=;
 b=ovXh6QCrZPxR9ub7+QWj0BVpTwYMtMEEmwCnm2MBk30yzFwULsiUCSC6/RfhDU3djmBAt+93oUhcOb2e+Kp7k3HWsFMBaAapSanQqWPkmV5YRleStD78poJWaJvlx6H9A1PQnEricCAuzAW6wuel0vVpUzvLWef2bsWcQwPpIzchjG3YRtqozvDb5bNnWyzQi3TG+7eTNpPYM7iehmfYcQCsUZpn0SIrNO0/aQDF0JdHNOxPcbBs59oMcyMlHD9nv91v6Z9qWo7t+H9sgzBX/jncmc51dwMKa8QcSyJblMujcRmPg481RI1aBppdTBQ0aoB8PmpefnhvyjAzrldmFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:32 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:14 +0900
Subject: [PATCH v2 6/6] gpu: nova-core: gsp: cmdq: add the GMC receive path
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-6-e481ea2168ef@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e6daa260-1fc1-4481-ab2c-08df3bd47ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|261026121527099003|261022075727099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|6133799003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DnqIpyg3bmYh7YQLBsovpGHccGTkog3jkbJ8LCuMj7W5rxrteytBkVTuZhuQY9eR2Qs6EyOetIs6S1dDX+Q48I2r435DalZ/73pOyCNodPeY+a0GBWXX80pEyg5PXSWDi4Bb05H9cUEQsr4yTk02Z4dm4kJoidgTkyySSJE7XHUOdW8WQP0LgJafLm5fcWR43JXHs9CewhQdrlZdvZbfpWcFqmzm0UMfJqrGiGd4CFaU4dTYjhC/ZVsXPuNGGtHXb9KEhD6j4IB1nAHcotMUPMgOdH/cX3n/T4PyZ8GnET1uJJ6Qu9Ss+K4cQdnIqyga++TuiP5Mxg5CK3qtmaUIUZcV7e7W5+TeS7JZn2Y9xyrWcjCKvfzZrxb6W+6SnSruCS5HklCS9xwv5uPbu0i4YDtrP7zEn61WMO0WpagmXtQhCJR66PV9ya2ejAEdl8Jfkr54DaNeSVmdDykwA5cp9dqNeUCX5ZsyhIfvI7mNm7IRLrBTUFZPAoCdSlqCKoK2UVkn73XpZ8owFXAO0LDD7xMIs5nMjUM4GdzQgpfjoPoPCOp1HGeyKbKfcD1zBBM5pxUEeQDsPe0/vHAQso27TjBbuTtPPe054qhJBy/UrxEZt1OadAcOeGyO1CADKq5szWqJ8tvpAnzYwy2c4FzyNhAAcTLv7QxHSWgxlH260V8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(261026121527099003)(261022075727099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnNjdjZObE05eEdUeG5zdDEwcUd4Uk9ncGx2dWlmK0QyaitYemJFdHR2RjRB?=
 =?utf-8?B?TURncmUzaW0zMUoveUl1emFtNURieVZ5bFN4YWdCbXg2ZkVWc3pTMlpXMVZu?=
 =?utf-8?B?dFJla3VaTWlCd1dMK05mait3T09zNUhzcXdMK2pRVUx3bTlxNGlRMEp6VnFq?=
 =?utf-8?B?dVpLNmNBb2tzT3hkanFpQVMyd2ZGSHRQOVFVUG03UTF0NDU1SWlwMDlybkIz?=
 =?utf-8?B?VzZyMmkrR1U1S3ZISmcvWnFLbGphcTI1YzdVRWdQSWtOQWl4Mzg5eGlvWXBk?=
 =?utf-8?B?TXYrL3kvN0VpKzFyT0V1amt4Mmd6SURveUNuVmZpTGFRcmk4TDZmVkhqQTV6?=
 =?utf-8?B?SnV4SnpsTDMxVE1POGVUWEhUVnZIczlZejNQVko3b1IyOTdsdXU4WTBJSjlG?=
 =?utf-8?B?cGxoQTRVWE43Tzg4bkkyaDFiNkN3dnpsczI1S0JCb0hnaW1sUG1pUG1LSWdk?=
 =?utf-8?B?NHdMcHJka0owK3VpLzhpcWtFZUlsVjVtSlN0RFplQU1PbjU4MythSXBHdGFI?=
 =?utf-8?B?WDhKNGhCaHJtSUhxWWZVSTdnYjJJYWRGdG5KSzBFWGNIdVJDeG1pNUkxYk5C?=
 =?utf-8?B?aVBSUmsvb252bUxhdm5Lc0J0b1dSODREL3M5L01KYlUzZlBuRC9NbkRNdU1t?=
 =?utf-8?B?aFFCSm9QYWRDRHB4c1JWc0x2TWwzdFRTemRZQ3g2b0dJZE5ZTzZwbEhEMHhw?=
 =?utf-8?B?cWtUTmR1YTl5bVpReWExNFBXTTlYZDRtVXBXbWVEb0VNRDByWlBNaGl5SG1l?=
 =?utf-8?B?NEszWi8ybzMydUYydDZsWXBhMkc4eWZ4RDNEKzdTNFJad0F2ekd1Umt3Ujl6?=
 =?utf-8?B?ZWZqaW9Td0J5cUJRK0JjQWpVK2hLUXljSEZmOWVrRTIyS3QrUWVwT0xqT2dC?=
 =?utf-8?B?cEJaQzVESHlpN1dkdGhwTTd3N2hqbkVXa2VSRTY3LzFnbWw1N29MUVE2cHI1?=
 =?utf-8?B?RnlPcTJPSDNYNU0zNCtjcE81QzZRRjRhcnVtU3dWN25CUkJwM2dDSTMyZzhk?=
 =?utf-8?B?OWp3dlc2REluS1E3eTVSRXZyTWFpZVJsaGRGWVEyL29Rck1tWFBDZjFyNmMx?=
 =?utf-8?B?MDhCS3E4RWRjQVVjZGNaNlgydHZHbWdwbHlBbnNWM0lTL0pLZFBJZ0VTcWd4?=
 =?utf-8?B?all4NHlTKzM1UjZsME1TakthdUxlQVFlOEI1U0FFT1AwRDI0UlhReXdsRzM5?=
 =?utf-8?B?NnI4SGlRZ2NFQWJsTFhUUFlmVWtLbk55Q2QyMUtSZ0Jpb0dEYmpBMEc0dHl2?=
 =?utf-8?B?emlYWGI1ekwxSDRMS0d6MGluaXVNdjNmeTJTMmo0VGdIMnN1R2dVbUxvRkk5?=
 =?utf-8?B?OVR2Qm16di9mTTdWeE5id1Q4SllOK0ZLMitKQ1hsK0pKbEtQSnRIZWdQNHVG?=
 =?utf-8?B?THpTTTVncWJBek5XR2JDeHhmc3k5RWhYOENwMG9GMnorajBmTlZzTWFPQ3N2?=
 =?utf-8?B?NS9EeURSS0ZrNUpya2lsaVhhYm9WRjhGaHRteHk1Wk5XZlMwVkhmazY4RFBn?=
 =?utf-8?B?eHRlc1d6ZHFRNUF3WmlGVXhvSWd4MzVyVjlHWDc2YTFtVitTT21RbkYzRVZE?=
 =?utf-8?B?NTRTa25pUW54cDJ0a3JNSEgzNzRQTEpMdUxzeS9oMkhmVmRkQm5sSi9FeC9a?=
 =?utf-8?B?VUR4TGtEQ2FsQkZWTCt3TTN4K3J2VDZtdWNiYjJ6bGU4ZVNQTjJLVEg2K01y?=
 =?utf-8?B?QnFPVVVkK2VDdjJBZDZHNGw1YXhsYTVGcGlQYWFIZmxKRURWbDBUZjVGeCtk?=
 =?utf-8?B?dkZGZ0hLYmk5SlFPYWN3eEMzYjdKZnlJUENoRG9ZZ0FkeW1DeGxHZ3U1Sk1m?=
 =?utf-8?B?S0RRRXhOSjZ2L0JVd1pqdW14QkNNL09HU0tqYzBZYXprNmthMGdWQ2w4Vk9M?=
 =?utf-8?B?QWxqMDVlVFI3WTltU3c0N1ZHdXJYcHorajlqVjdXQ3IzUHVac0NQeDE3TlJi?=
 =?utf-8?B?NG5TaitPV2lUdDR0QzdEV24vdU9vdXZSczNTV0NpOUE5cEFjYzU2akU1NUVK?=
 =?utf-8?B?eTU2a1dBWXphUWhIZUw5SWp2WCtobXBlb1dVR1ZSY052ZjhzVTNyQjBHVGM2?=
 =?utf-8?B?YTNnYVJ0VVBCT1FVOVZMc2NFZnBxK0U5TGJCRFhRTEl1STg4NWNLdFVMMk9w?=
 =?utf-8?B?RTB0NmpnbDhseFU0K3lnWVMrREJSZGZaZzgyYUlTeTJFK2tsNUFvdkdWb0k3?=
 =?utf-8?B?andkYUkzOVZmSFNRSk93RUtwcTNRT2s0OU9IOXVleDV6cldmUlBxU1VYQUpu?=
 =?utf-8?B?SEkvK0cxS0lIZGR6VDFqVGJ0WGJUUUNyTTVSV04waUZMOFhCOWxJOTJ6Qllz?=
 =?utf-8?B?aDU1UFdDZjdEY1I1cFB5aUpzN2ZxbThXQXd1ZjRqZEpJb1ZaM1ZLZHFWSi8x?=
 =?utf-8?Q?QueST82+owDzDP/+g++GvXmnUMz83kzUM6aW5ReQ5lIT5?=
X-MS-Exchange-AntiSpam-MessageData-1: p/4N7F+TnFfktg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6daa260-1fc1-4481-ab2c-08df3bd47ce3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:32.5257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8gmqLc3C+k8a3oO7o/vyuU1NttZIxyEUMJX2z+BJGQuSKDerABQilhQFcsIHIvqtEIppwc3eb3v6Eygvjs/uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

From: John Hubbard <jhubbard@nvidia.com>

GSP-RM answers a GMC request with a GMC message whose command word
carries the response flag and the id of the request, and whose sequence
number is that of the request. It also raises GMC events, named by a
command id. During boot, the load-and-execute events arrive while the
driver is waiting for the GSP_INIT reply, and GSP-RM only answers once
they have been handled.

Add the receive side of the gmc sub-module, mirroring the
already-existing rpc sub-module.

The transport cannot produce GMC messages yet: the r570 queue element
header does not carry the type of the message it transports, so the Gmc
variant of GspParsedMessage is only constructed once the switch to r000
makes the transport dispatch on the NVDM type. The RPC receive path and
drain() account for it by logging unclaimed GMC messages.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |   7 +
 drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 232 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs       |   3 +-
 4 files changed, 248 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e6a46c5b5160..81f1d779e264 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -428,6 +428,12 @@ struct GspMessage<'a> {
 enum GspParsedMessage<'a> {
     /// A [RPC message](rpc::RpcMessage).
     Rpc(rpc::RpcMessage<'a>),
+    /// A [GMC message](gmc::GmcMessage).
+    //
+    // The transport header of the r570 firmware carries no message type, so this variant cannot
+    // be constructed before the switch to r000.
+    #[expect(dead_code)]
+    Gmc(gmc::GmcMessage<'a>),
 }
 
 impl GspParsedMessage<'_> {
@@ -435,6 +441,7 @@ impl GspParsedMessage<'_> {
     fn log(&self, dev: &device::Device) {
         match self {
             GspParsedMessage::Rpc(rpc) => rpc.log(dev),
+            GspParsedMessage::Gmc(gmc) => gmc.log(dev),
         }
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
index f741de8288c5..e7babd4aaf3b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
@@ -19,6 +19,8 @@
             CmdqInner,
             CommandElement,
             GspCommand,
+            GspMessage,
+            GspParsedMessage,
             NoReply, //
         },
         fw::{
@@ -158,7 +160,154 @@ fn write(&self, dev: &device::Device, seq: u32, dst: &mut GspCommand<'_>) -> Res
     }
 }
 
+/// Trait representing GMC messages received from the GSP.
+///
+/// These can be either replies to sent commands that expect a reply, or an event not bound to any
+/// command.
+pub(crate) trait MessageFromGsp: Sized {
+    /// Error type returned by [`MessageFromGsp::read`].
+    type InitError;
+
+    /// Method reading the reply from the payload of the message and returning it.
+    fn read(
+        payload: &mut SBufferIter<core::array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError>;
+}
+
+/// A GMC message ready to be processed from the message queue.
+pub(crate) struct GmcMessage<'a> {
+    // Reference to the GMC API header of the message.
+    header: &'a GmcApiHeader,
+    // Slices to the payload of the message. The second slice is empty unless the message loops
+    // over the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
+impl<'a> GmcMessage<'a> {
+    /// Validates the GMC layer of `element` and returns its GMC API header and its contents trimmed
+    /// down to the GMC payload.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the element is shorter than the GMC API header, or than the payload length
+    ///   advertised by the GMC API header.
+    pub(super) fn parse(dev: &device::Device, element: GspMessage<'a>) -> Result<GmcMessage<'a>> {
+        static_assert!(size_of::<GspMsgElement>() + size_of::<GmcApiHeader>() <= GSP_PAGE_SIZE);
+
+        let GspMessage {
+            contents: (slice_1, slice_2),
+            ..
+        } = element;
+
+        // Per the `static_assert!` above, the GSP message header and the GMC API header together
+        // are guaranteed to fit entirely into a single page, so it's ok to only look at `slice_1`
+        // here.
+        let (gmc_header, slice_1) = GmcApiHeader::from_bytes_prefix(slice_1).ok_or(EIO)?;
+        let payload_size = gmc_header.payload_size();
+
+        dev_dbg!(
+            dev,
+            "GSP GMC: receive: seq# {}, command={:?}, length=0x{:x}\n",
+            gmc_header.sequence(),
+            gmc_header.command(),
+            payload_size,
+        );
+
+        Ok(GmcMessage {
+            header: gmc_header,
+            contents: super::trim_message_slice((slice_1, slice_2), payload_size)?,
+        })
+    }
+
+    /// Returns the GMC API header of the message.
+    pub(crate) fn header(&self) -> &'a GmcApiHeader {
+        self.header
+    }
+
+    /// Returns the payload of the message.
+    ///
+    /// The second slice is empty unless the message loops over the message queue.
+    pub(crate) fn payload(&self) -> (&'a [u8], &'a [u8]) {
+        self.contents
+    }
+
+    /// Returns the status code of this message if it is the reply to `command` sent with sequence
+    /// number `seq`, `None` otherwise.
+    fn reply_status(&self, command: GmcCommandId, seq: u32) -> Option<u32> {
+        if matches!(self.header.command().id(), Ok(id) if id == command)
+            && self.header.sequence() == u64::from(seq)
+        {
+            self.header.status()
+        } else {
+            None
+        }
+    }
+
+    /// Logs an event, meaning a message that no caller was waiting for.
+    ///
+    /// A reply that nobody claimed (e.g. one that arrived after its request timed out) and an
+    /// unknown command id are logged at warning level. Other events are not logged.
+    pub(super) fn log(&self, dev: &device::Device) {
+        let command = self.header.command();
+        let seq = self.header.sequence();
+
+        match command.id() {
+            Ok(id) if command.is_response() => {
+                dev_warn!(dev, "unclaimed GSP GMC reply to {:?} (seq {})\n", id, seq);
+            }
+            // Nothing to do for the remaining known command ids.
+            Ok(_) => {}
+            Err(_) => {
+                dev_warn!(dev, "unknown GSP GMC command {:?} (seq {})\n", command, seq);
+            }
+        }
+    }
+}
+
 impl Cmdq<'_> {
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// GMC events that arrive before the reply are passed to `on_event`, and RPC messages are
+    /// logged and consumed. The boot sequence relies on this to handle the load-and-execute
+    /// events that GSP-RM raises before it answers `GSP_INIT`.
+    ///
+    /// The queue is locked for the entire send+receive cycle, including the calls to `on_event`,
+    /// to ensure that no other command can be interleaved. `on_event` must thus not use the queue.
+    /// An error returned by `on_event` stops the wait and is returned to the caller.
+    ///
+    /// Returns `Ok(Ok(reply))` if GSP-RM completed the command successfully, and `Ok(Err(status))`
+    /// with the `NV_STATUS` code of the reply if GSP-RM completed it with an error. The outer
+    /// [`Result`] is reserved for failures to send the command or to receive its reply.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command does not fit in a single command queue element.
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply does
+    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, however many events arrive
+    ///   while waiting.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method, or if a message fails
+    ///   framing or checksum validation.
+    ///
+    /// Error codes returned by the command and reply initializers, and by `on_event`, are
+    /// propagated as-is.
+    pub(crate) fn send_gmc_command<C>(
+        &self,
+        command: C,
+        on_event: impl Fn(&GmcMessage<'_>) -> Result,
+    ) -> Result<Result<C::Reply, u32>>
+    where
+        C: CommandToGsp,
+        C::Reply: MessageFromGsp,
+        Error: From<C::InitError>,
+        Error: From<<C::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        let seq = inner.send_gmc_command(command)?;
+
+        inner.await_gmc_reply::<C>(seq, on_event)
+    }
+
     /// Sends `command` to the GSP without waiting for a reply.
     ///
     /// # Errors
@@ -199,4 +348,87 @@ fn send_gmc_command<C>(&mut self, command: C) -> Result<u32>
     {
         self.send_command_element(GmcCommandElement(command))
     }
+
+    /// Receives the reply of type `C::Reply` to the command sent with sequence number `seq`,
+    /// waiting up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
+    ///
+    /// Any GMC event that arrives first is passed to `on_event`, and any RPC message is logged.
+    /// Neither extends the deadline.
+    ///
+    /// Returns `Ok(Err(status))` if the reply carries a status other than `NV_OK`.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the reply does not arrive before the deadline, however many other messages
+    ///   arrive while waiting.
+    /// - `EIO` if a message fails framing or checksum validation.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] and by `on_event` are propagated as-is.
+    fn await_gmc_reply<C: CommandToGsp>(
+        &mut self,
+        seq: u32,
+        on_event: impl Fn(&GmcMessage<'_>) -> Result,
+    ) -> Result<Result<C::Reply, u32>>
+    where
+        C::Reply: MessageFromGsp,
+        // This allows all error types, including `Infallible`, to be used for `InitError`.
+        Error: From<<C::Reply as MessageFromGsp>::InitError>,
+    {
+        let dev = self.dev;
+
+        self.await_msg_with(|message| -> Result<Option<Result<C::Reply, u32>>> {
+            let gmc_message = match message {
+                GspParsedMessage::Gmc(gmc_message) => gmc_message,
+                _ => {
+                    message.log(dev);
+                    return Ok(None);
+                }
+            };
+
+            let status = match gmc_message.reply_status(C::COMMAND, seq) {
+                Some(status) => status,
+                // Reply to another command, e.g. one that timed out earlier.
+                None if gmc_message.header.command().is_response() => {
+                    dev_warn!(
+                        dev,
+                        "GSP GMC: unexpected reply ({:?}, {}) while waiting for ({:?}, {})\n",
+                        gmc_message.header.command(),
+                        gmc_message.header.sequence(),
+                        C::COMMAND,
+                        seq,
+                    );
+                    return Ok(None);
+                }
+                // Regular event, pass to handler.
+                None => {
+                    on_event(&gmc_message)?;
+                    return Ok(None);
+                }
+            };
+
+            // `NV_OK` is zero, any other value means the command has failed.
+            if status != 0 {
+                dev_dbg!(
+                    dev,
+                    "GSP GMC: command {:?} failed with status {:#x}\n",
+                    C::COMMAND,
+                    status
+                );
+
+                return Ok(Some(Err(status)));
+            }
+
+            let mut sbuffer =
+                SBufferIter::new_reader([gmc_message.contents.0, gmc_message.contents.1]);
+
+            C::Reply::read(&mut sbuffer)
+                .map_err(Error::from)
+                .inspect(|_| {
+                    if !sbuffer.is_empty() {
+                        dev_warn!(dev, "GSP GMC reply {:?} has unprocessed data\n", C::COMMAND);
+                    }
+                })
+                .map(|reply| Some(Ok(reply)))
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
index d01a9f4f953d..10d3f68b2f61 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
@@ -369,7 +369,13 @@ fn await_rpc_msg<M: MessageFromGsp>(&mut self) -> Result<M>
         Error: From<M::InitError>,
     {
         let f = |message: GspParsedMessage<'_>| {
-            let GspParsedMessage::Rpc(rpc_message) = message;
+            let rpc_message = match message {
+                GspParsedMessage::Rpc(rpc_message) => rpc_message,
+                _ => {
+                    message.log(self.dev);
+                    return Ok(None);
+                }
+            };
             let function = rpc_message.header.function();
             if matches!(function, Ok(f) if f == M::FUNCTION) {
                 let (cmd, contents_1) =
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 08f97c4e73a0..75b98f24dea1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -939,7 +939,8 @@ pub(crate) struct GmcApiHeader {
     inner: r000_00::GMCAPI_HEADER,
 }
 
-#[expect(dead_code)]
+// Using `allow` instead of `expect` here due to rust-lang/rust#154377.
+#[allow(dead_code)]
 impl GmcApiHeader {
     /// Creates the header of a request for `command`, sent with sequence number `sequence` and
     /// followed by `payload_size` bytes of payload.

-- 
2.56.0

