Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044926;
	b=oymevYCI0+Iia9K7fkLjR1iWIQ+8ZUnC7bef7VZ63aztVgQSKK5fa+6B7AMhg4Rn0Xrb
	 G7q/J71kEY3m/vBwemknwd4A9Fpg6d2ylEabLUUR7xOSYQ1vLOX1LxG7lySl7GF/BnjG1
	 Ejbrzd9w5dSuYMSA6R2potWj4BC9F6MWQyFHsOaOXsf8v+U42CcXe1Tk3drzTL40urvRQ
	 t1AXcSs27Cn73hTId9mIwKBEC6JSH7sehjfH+CmQ8aizoRfd8WiOSIQAwUK2A/VoP8bdK
	 FWYssvuIDxSOHGUBXF7WueQSq6Y18jCTXWDkGCpm11R5pqJ+Hw7OWP3XGjEtJ5r4D6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044926;
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
	bh=WvsCvws8cJjVdT/TWSYzpl4g3711N75bjb6aKyL6ZME=;
	b=VrHu/FXYv5JwvfNC8y52LnY7iok7pGRgExgDbz1rN1VxOAfWD+I+ktUZj2IF3Bk9KCYu
	 3GSXQyPB3nXd+iZa7BUvO+7zgi9RFEMpuQQYSZuMMb/EVIWpD/IoOYy/xYrzl6OhKwxvO
	 pQd4CG7ZJSDUaTIb8VPp2YgnmCncCuOKRQLY+dCx2T0wSoZsKmjgcfOPoRL03BGAPVDB2
	 ogrYBC+c9ifKkNRBT6eVr9AHIxYgQcNYk3ywvjm35+c7FwOPsmZ46sFBXL1c8/K/QUR03
	 eZpvdnofooP9+ISLBmnsK29KMJjM2T/QwgOVdb6gcTvLFnkoPMLaWkVBN6LeCqsZwjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cBZoypsI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B60606A337
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B60606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cBZoypsI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLIe4q/6Clh0ktRJ6SWiYkqqfKl0jfs0h7rgiQr46aZDN2WYj4OM6DhE/oC1SCpZpZQ3RuJsvUTAm46hAfvUbIjYO6liCpFJM0wlNpPoZwg0O/hOkTeUm/FTrtYG1RIgLgW11Fb8UiytqccLPdXMQV4Hdwq30b1wG4Hrh24mVTKwnah6nJlhkVoDbejZmKK2B+h/IYabidQrAWCxFIoz2jTZ3nR5HsG58X4hTi43l5RCt5iz3UgFVxLR8k/qS+bdG+Wuk6kpQNOVmQnmYuRa5S/1Z0RvE2BW7XDQ7YV1U7PupJU14vdw3LZIH5Cmv0kNszm82zvWCw+zX16bihM5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvsCvws8cJjVdT/TWSYzpl4g3711N75bjb6aKyL6ZME=;
 b=UObRc3cSki64QJ5H14rG0trf3ozu/IWnuUPtL89xF1qffIF9rkf/xR7eVl23kBJPO4EUN469MJUNwAlOpKrfiY2QskZ45bpdisjy7F38Lz1BN3m0D3qphFdoiUZKEUKtUxMrCBn+sy9nz1jCRk7NL4AmABHnpPMno+OA9C2sUmkFH+XJ9irVGnSf/3/xYpeOHV9uvlDN7r7ojN4I0fbUf1Jhf7FFoToyo3wslLUAp7wM6badxlD4nbOV0FNNzaoolzdGOexopgbyhJHVJBhYq9tkU9hXkZihOC958xqXgU+cMohV0+K68JxwrYPzfS+3rFlXrH9LDZKooi+0g8xS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvsCvws8cJjVdT/TWSYzpl4g3711N75bjb6aKyL6ZME=;
 b=cBZoypsIGqIYR29B41YdKDS5GrdG+CfnpJz6aUXawOaDsaYYnZMM4eQ4bPYOVli9oakB/pMjMllVMMJdI1jNNfKnvAHC3H4/pf3mfCzuif6wZxoVOSgxxYe2GVtzmWhv7kGxWHQ+Gqvo+3nKGzycMEc/qwL6SWLYRG2UdDslnjAUOmwSF3J2czVK1t0bQRLXJE2GzlK4cy2RTIlFQ389w5r5TS47SMfnhhMdnKR9ZyL95/bcKSLVF7rzW6i4URW8572WGxF6MMoDwYm9tytm8lLS3Tcw6+QoCqj/q0K5WplVlAn/JiXNdoVMZYJUFFo3teLdXXNPIRJsHbNtlDR/ew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:29 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:47:59 +0900
Subject: [PATCH v2 03/12] gpu: nova-core: place the generic bootloader at
 the top of IMEM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-3-fb37cc5b20cd@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0276.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::13) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 365a36c3-3056-4cbb-88e5-08df3cb446ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|11063799006|261026121527099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	fzgkwCUeQ8xxUtoBb1e4cPppUMAmxJhsxBuM+eTLSI6mv7nDFMFlCDQe93BoXNtSi9cJkfX5e7XvTK7FqiMquEJWAydHfmJpoH0Vjk25r5bCtxPI3ZfpbF80A/gg4TXtb4mfQSS9Vo5ZUCqgYk4G1+PfxF7uKSlMpqICU4rf1WNiqIdJ/k11eIrbVeS9Hd/mBV6RjkTRQPVJ4XYSdV5ePJwdNaQukWncMvfLyC4rO3rLXtnR1r9Ajs3fgAsgpnWqCJP7WhULi4BRqTc8G8lAMXDx8poJbWk3UdTIhenzoxxOWO7w8CrlQosRqT0GZBZvHO+pYKP2JlO6VK+dSnqP9RVvpZsEjcQQPNAMKdmTALOjBBJ1IhT+yLymi4BTHbNetmCQYo99v+jY+k16pTW86XwUDqXQJQwbVQG73aqdux/nt9CpFkbd9qdVD7v1AuOpeZ2ts3iiogejFC7ctfxk+vTIpS5u3ODVnEHzCEVQh2ZANjeONXbU+C5bE8sOaHQOqeygXTrq1nvfBQUCA6NXf65R+AIa9NOKPgRdiidkeY4FCi8UQFW7nIQLIZkIIsUda2AZxlReTAmiLSRKYMHcTXSVLf/2s8RYrq541j+FCO/yN+m0GIcxZCKNo++dTvfUcKgwLGYPWDBC+QZ1DEdP6N6lnZyHAxGS4/CgM7VP6t4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lLUHZyM1hmMmU1Q2ZLVkt6Q24zdlUyUCtlN1pVdlBQUndDZ1poWHlMbC8w?=
 =?utf-8?B?OXRobkpEMjJLU0pFWFFCdi9qdnp1dmt3Z1FvYUZPUGRJVEgxVENlcHVVajBw?=
 =?utf-8?B?NkdNR2FvalFFZW1qT1pZSDdYcTRZVXAvWU9JSGVtb09STXV3VDNDam15azJ3?=
 =?utf-8?B?Rk96eHVpMjB4TjdvdjRYWGpjVURXU0RXcVZxV2RFYVU5dUhob0JMeGQ5ZllT?=
 =?utf-8?B?a2VxZlNBL2twODA1bzBnOHhGN0ZMNDg0UjRXUVc2SUJSenZ0b2kyQmtwSmVB?=
 =?utf-8?B?Zmd4a3FzWDJGdXVOMFJ4QmJtTVNVNUdwTHlNRmN5R1FDaWY0Y25EUjVaOENM?=
 =?utf-8?B?RkhxSDViNUY4aHU0a21hUU9xSGVISVF3OGpGbkhDY0IwazJlL0ZZSFF4djhy?=
 =?utf-8?B?TVpYaXRqNXpaMnVvSlYrc1dRTFd2NGxyWU5OSy9IUGtsVWpxM1ZBeGxPMU4w?=
 =?utf-8?B?ZTZJUzhqRTlZRURaZ2hJZDUxcEVjSHZIR1hvdDVQL091Kzd2WVFka2V4cjVs?=
 =?utf-8?B?TlhZREg2OTV4Y3RJRWZNT1RRODVHS3lnNEs3S0ZjbW1KTGR4UEhEc1pUS3dX?=
 =?utf-8?B?a0QwT1lXc3NhUk9xZmxuenpHYVZudjNyK25kRDZ5UWpvZ2wyZHJId3QvaWZt?=
 =?utf-8?B?c3VFUVg5aS96TnRHaGVRNnpldTF3VkZVc2VvZU9NUE1MQ2JCK2JoTE1QV1dv?=
 =?utf-8?B?a29aU0F1bE9CdWVibDFsOThlTFRFb2k3SWNxd1pDRy96RUdPWEJOUXFsSmVU?=
 =?utf-8?B?ZU1tTTdUUGNwZDdJS1RmT1Q1V3QvLzRXeVZrZ1J6NktmUk5zWjdyZXVoek5V?=
 =?utf-8?B?WkNkOWdUZER1NGgvbzVHRFhUZzlXNzV2Z09VSXJPTlZGNWIzUlBCOURFckRN?=
 =?utf-8?B?QjR3NjM2Ky9waVQrMmdpTXBybStBVVpaelEraVo3enpXZHBmUkNEZkFkVmZk?=
 =?utf-8?B?R1kxc24zOEVySGxienBDV2JQSUFIQVVDWXg0SVhSaU5RK0txc0hJUHJ0L2NE?=
 =?utf-8?B?bUovb2t0QUdNREJ3eGF1VG94K1Rnbmt3Z1RhYVhrc1FVREI0djJBSU5lQ0U5?=
 =?utf-8?B?MFRWdjd5NFhzSVM5ZlVXRnRqeCtBdldiWkZyVitadGNobVJHa2JZcm5kOFBr?=
 =?utf-8?B?L1JGTjl6SWpQaEhWd3YxelhseTh2Q1c0aldBa0VsYlIrbXJuZkE1NWZ0bmZG?=
 =?utf-8?B?R3pnUnZtMW1hdW0xQkc5UVk4WlEwSnFsVXRCMTZFNjJ2b04vV3haWDIzbFBx?=
 =?utf-8?B?aUkrQXRJUlV6WGVRUkhGUXZHYWxTL2J4Nm1xV2RQRkV1KzEzcDl4TUI3MVJj?=
 =?utf-8?B?OFZXbVlnREY4WndrdDErQVlZZDRBaTN1R0h4bzY4SEJyWFAzNVExbmV2RVow?=
 =?utf-8?B?U2RrN2F3Y2NwWVNhNXl5TWJ2bVNGck16U0k4NDdZcmRVSXljR1RtR0VPZkxC?=
 =?utf-8?B?RkVDdmhsWUtRMUFoNUYwc21xNXcxRVg2R3NRUmtkR1RqYlNRejhDbWdrSlFj?=
 =?utf-8?B?VW9qTkJ4TzRsejcrRWtFOW5MaHczWTM4Sy9FNitOSTczUGJjdjczZ2JWUXp6?=
 =?utf-8?B?dE9qNVhPU0VqQThWSThvWkZudGdOM1gvMkEzS0FzR0RTeUVJZUJZbjYzbHkv?=
 =?utf-8?B?Z051T01TRUJpaWt2a0tiUUwwL1lEaGg5R0lMaCsxZXlCc1VSR3U1TExqYmli?=
 =?utf-8?B?U25vRGdNZWEzdlZ4RlNYME5mM2E3SUhIYWM1NUx6SUNTbjEvUlBTcDJqQVk5?=
 =?utf-8?B?YXhaeWphSFF1aWlCZ2tXay9RSnBuSWFiRU15Q0xmcm9uK0QxZDVTUUVNSEhH?=
 =?utf-8?B?dTNzNlhETE1oTUhOVlJ0blhUMWlpaE5odjZKOHlmWkM5L1VkVS9HUzdFVXE0?=
 =?utf-8?B?ZktMdmNzbmJSaVlPZEt2WlpQOUpwZ240djVqOVBUellxa0JWWXJHUk1ta3RH?=
 =?utf-8?B?M0pyQ01uaUFLMyt1aTd1alpTZEZobG01b3g4NjhOcGFKR2xGa050dmdRdTdm?=
 =?utf-8?B?SFUzbEdVR0dVZ1MzaGcxc2NxaHZPN2FBS1QvaVV0and4cGF1cEpMNXR5WDZw?=
 =?utf-8?B?VkNaNlJUVkliOUx1ZFVKaStZL2lkTU4xc1dLdllxOHJTZ2dzMGs4dlNPVFB1?=
 =?utf-8?B?eHNmNkpLUlRJSVZHZTJTWUE0Rm1ISnQ4N3NoOWFGTHAxeDNDaUJYdEhUbWUx?=
 =?utf-8?B?VllKNG0xVmZoaTZqZTZIdWpuQVl5aitKc1hDMi9qalBMbVhLNlFSVDZNY3FZ?=
 =?utf-8?B?bWg3WXR2UG5hS1hDcUdMT0lESzBBN0JoaXNLUzZVMDk3V0E4UzBUYWhZZ0pF?=
 =?utf-8?B?eU1Cbk90dW5abWtYVGovUndyM1RHMHFpNEw0Mjk2SHU5cEpnTG9vOTFLVmVp?=
 =?utf-8?Q?gVODaRI3Dh+8KstUdueg+Fs34c2L32tsoZs5iguyBmYVl?=
X-MS-Exchange-AntiSpam-MessageData-1: 7pEgIYYhkgLT8A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365a36c3-3056-4cbb-88e5-08df3cb446ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:29.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnvBfDYp82oD3xVA+naBmULPCDH9GpTkal7uzKDKdZMhuNkiUIePSoQKX1cTGXoPHuO7CDzQOta5VGUVO228sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

The generic bootloader was loaded right below the first 64 KiB of IMEM,
on the assumption that every falcon it runs on has a 64 KiB IMEM. The
r000 load-and-execute bootloader event can name any image for it to
load, and the bootloader must then sit above the blocks that the image
occupies, that is, in the last blocks of IMEM, regardless of its size.

Place the bootloader at the top of the falcon's IMEM, using the IMEM
size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
[acourbot: split out of the patch separating the bootloader from FWSEC;
 convert the IMEM size with usize::from()]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                    |  7 +++++++
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  7 ++++---
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 21 +++++++++++++--------
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |  6 ++++--
 drivers/gpu/nova-core/regs.rs                      |  5 +++++
 5 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a34748abc74a..b17a997860ef 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -386,6 +386,13 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM in bytes.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks = usize::from(self.pfalcon.read(regs::NV_PFALCON_FALCON_HWCFG).imem_size());
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.pfalcon.update(regs::NV_PFALCON_FBIF_CTL, |v| {
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 80239301bbfa..00f0d9704883 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -103,14 +103,15 @@ pub(crate) struct FwsecFirmwareWithBl<'a> {
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
-    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap `firmware` so it can be
-    /// loaded using it.
+    /// Loads the bootloader firmware for `dev` and `chipset`, placed at the top of `falcon`'s IMEM,
+    /// and wraps `firmware` so it can be loaded using it.
     pub(crate) fn new(
         firmware: FwsecFirmware,
         dev: &'a Device<device::Bound>,
         chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
     ) -> Result<Self> {
-        let bootloader = GenericBootloader::new(dev, chipset)?;
+        let bootloader = GenericBootloader::new(dev, chipset, falcon)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 16ef2c79a6b1..c4f436104326 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -12,13 +12,14 @@
         TryIntoBounded, //
     },
     prelude::*,
-    ptr::Alignable,
-    sizes, //
+    ptr::Alignable, //
 };
 
 use crate::{
     falcon::{
         self,
+        gsp::Gsp,
+        Falcon,
         FalconPioImemLoadTarget, //
     },
     firmware::tlv::{
@@ -40,15 +41,19 @@ pub(crate) struct GenericBootloader {
 }
 
 impl GenericBootloader {
-    /// Loads the generic bootloader image for `chipset`, placed right below the first 64 KiB of
+    /// Loads the generic bootloader image for `chipset`, placed in the last blocks of `falcon`'s
     /// IMEM.
     ///
     /// # Errors
     ///
     /// - `EINVAL` if a required TLV field is absent.
-    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
+    /// - `EOVERFLOW` if the image does not fit in IMEM.
     /// - `ENOMEM` if the padded copy of the code cannot be allocated.
-    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
+    pub(crate) fn new(
+        dev: &device::Device,
+        chipset: Chipset,
+        falcon: &Falcon<'_, Gsp>,
+    ) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "gen_bootloader")?;
         let tlv = Tlv::new(fw.data())?;
         dev_dbg!(
@@ -72,9 +77,9 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
             ucode
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+        // The top of IMEM, above the blocks that the bootloader loads the image into.
+        let imem_dst_start = falcon
+            .imem_size()
             .checked_sub(ucode.len())
             .ok_or(EOVERFLOW)?;
 
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index e90db1a23032..1b17ece53bd6 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -165,7 +165,7 @@ fn run_fwsec_frts(
         )?;
 
         if self.needs_fwsec_bootloader {
-            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset, falcon)?;
             // Load and run the bootloader, which will load FWSEC-FRTS and run it.
             fwsec_frts_bl.run(dev, falcon)?;
         } else {
@@ -223,7 +223,9 @@ fn build_unload_bundle<'gpu>(
         // Load the FWSEC SB firmware, as well as its bootloader if required.
         let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bios, FwsecCommand::Sb)?;
         let fwsec_sb = if self.needs_fwsec_bootloader {
-            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(fwsec_sb, dev, chipset)?)
+            FwsecUnloadFirmware::WithBl(FwsecFirmwareWithBl::new(
+                fwsec_sb, dev, chipset, gsp_falcon,
+            )?)
         } else {
             FwsecUnloadFirmware::WithoutBl(fwsec_sb)
         };
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index bf3a43f1c09e..af0bbb92e992 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -181,6 +181,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ 0x00000108 {
+        /// Number of 256-byte blocks in this falcon's IMEM.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;

-- 
2.56.0

