Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346216;
	b=BQPQ9gNNXR/RtU60YfUpBJ3ILOK75WR8K4Pn8N5FQ4ChW2fAxVTPMxrbPlEZ99xYnrms
	 ZD3gYOO9qbqT4/GZzU0MgYE/CS+QB+XaAlLDYx+BYpsROyxKHArtloY/ardYLzc0j2FxF
	 VyS4SN0W3lyS679IRV/2CIMiV4FA5t9o1G52Bzc3zBQrQl1/EEbbzqq5Evm3ku0AWTEYL
	 0jBw2/3MHfcbGYrjHQ+1Yl1SQkRG6TGTnHjIYkqhUg2UlMcxXIqnzAms2DjYhBKBtKIlr
	 oEcIDF0VwvpDHAAv+kSR2xlggKQJ9vzFtX6WNj00qQB8al/gXXrTcv64TSjHzkNG2Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346216;
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
	bh=YNeVdKdXQphlf828gZakjVw1uJFNMj8q4BnETnQP3uE=;
	b=Qj64ntxPpqPSFC+EdWlXX6WZwbAetDqpCNE9OXW348+2vItzvRJObEqv90gE8L6pYhTu
	 JwEMrPKWjesiyaro5uhm4vEIOJmAJ88dLa6+ehWDu3dKXryVE9AcEcRnc6vTqafcvV0RV
	 TkIMDyOUmQPDY2viBzg6edC4XOLKF1TelOaYJelmMaiK5OqV8W5B/oJZUn+yjbNC0GuB5
	 jfrmLeBayV218NAHhmNi61BOkoTXhf6sQRNfLjfEA5Ye0Vr2/tP/RS85t+FCb5VlAkDIC
	 SW+03i7F8hs8qSOM+BPp1Walcvb31eeIZOYCDcwxG0/5AZb4owGRHKynr09QWUXZtMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lJaMiCMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B7606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 07:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lJaMiCMN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVTelA6PxL/niMVXaJoGRRLXylXIBplvtOVI/O2/W1SqW5Na1gZaeurqLDjmxH5deOr/ft61vYfuu5trveNplquGLgPouiU57btyeaEYxp18jSq6ui/9ijboNLBOqFUDxiK9Eeo0g7IYKeMr5sjlQl1AEGZP8gIycI/ZvPd8oZQbwSRX6ju0rG6+YbtQnRIH+sfLa0nUosq6YpMMhX1luaRmYNGKk5IHbaKhC/cnI6X9N8a/ZotqAP/ksn3hlJ7/5Um6J/J4ce3sSC0vAWc5coYWAaxbXa2m5teR2EKRgR2Q2U2GngzMkDrQOfcDj5praI6cewMzmbSD8sHWWgge4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNeVdKdXQphlf828gZakjVw1uJFNMj8q4BnETnQP3uE=;
 b=Fhx3zagKYtLntk3EodgETg2UgIsUAzIv0c4CaduFMIu4xhSEus79p+Cl8CtWGxkZYXGeMgmzeVQemU5n3R9a+EcR2NkjAZfGoltSSjiuFYNtmoi9xe9XQa/nqicqazfOyWt251htrapsOfdbnh61Rif/KQQjX3auyjHWVfEE8OGC3xkRuFbR3v01uUBVWz6470mx5JqUrKWAfIf9BIJlDOG5+QPn7rGe/t93hnzCwkpLjy0GhKnP9Ze9GItJLgmUbCa92rmizsM/E1QH8QUzoiyzBkmdtzQt+/4xolU0lulOGkPBxE9c31tpO8g3qMHnvNJ0AIPW67cEQsVhyY05YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNeVdKdXQphlf828gZakjVw1uJFNMj8q4BnETnQP3uE=;
 b=lJaMiCMNWjJruWN5qjuFAergreEs/1dyoTQKtocR8BthxKK63ZUjucb3Sxz+FPQyrEfOW6tmmJhfLTTOWEAVkXWkPc9wKV3CoCv9fTa0QAGH9eZe7nLt7aJG6RVidQY0QXvpmC/JlnuivBljRUaWynlCQH1sE5/rv1QAGIDUDsuoy6rCQ/qiDConYY8tEz51jQ7dG23QYIqPk+eZE4PfvQFQPFjoKjf+qQGgY2kAFA1cTgS07h3jCtZerjCOejfoaqoG47MAtM3yzXia70/7jNGg33qnWwGWIMPYcu9Z+nk6kVbbfeu5e/Ey7XqTnMoj2tOmcuw1OTF4qH4MtgxnPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:43:23 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:43:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/4] gpu: nova-core: gsp: cmdq: preparatory changes for
 r000 support
Date: Fri, 30 Oct 2026 16:41:31 +0900
Message-Id: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3SIDAwPd5NyUQt2CotQCXbNkUzMTEzNDy2RDQyWgJqBgWmYF2MD
 oWAi/uDQpKzW5BGSKUm0tAG3PmB5yAAAA
X-Change-ID: 20261030-r000-cmdq-prep-6c5644619c11
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:604:257::12) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 0241e77d-69e3-40fa-18ec-08df365978f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7UYrtTJJQr0sM0U0jI1mUaAoex6cCk0d7ZHVz6DMCmfO0K69J24RoccBKjsUg+ftjyiqYZ/K6Nfzco5qm914zQLt+Gyhu0MDL2zdNL7I6QKW30RMkfnqIWnQwfr26TM+b2j4sCaM+ntqx5HlxRx8rBWyJddrHh3HV6xdIbmIIOiZEd5cM6wgcMZg5+WZ7KdOVGNRY2Nu9Bys3iWLJE0tQWp/DA78+bws9F6jMBJ8ymYhqEc/kjoFnfU4O+4SeBGSmA3/0UDJlWSJqneP9BGDBEt5PbDKtSfNfZnhGKc+PZ+oI4M2rFrXXuATLERzRFh0q2l+pnh+t7w3egJnRNhX0qWZMxHUiVHyGTdrTPs+MfTFmKKR2DjH5bEP79p1KjKzbqiLawdwKS1XiF5gXXoJViXgYKMPla10a3e8RecTUZMntAH1jscJ/BHDjkmEVmbwQS8dbX1d6D0AxpwPTT2/GkxEbkKiOBCQOpT3f2mfsptic+VjLUeQt0nyskWWMigWKdM/d1GjF1S4vnd8TB5bxH7WDls3/U2PXS7GiB1Q1hWVLDWQUYR2s2wYRE1wk3H2zQ1SShCfj6wK13Eflj3/Nz3Y11A2ECQ2WqAdJIL2jr7bEK+z8QelNgLqpKesraEGjc4v5qBM1sUyj5ytJjpBdQDVGK0ex/SBjTxqW/KHTTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXJKZVRTNTcvRGVVZ1dNdlhXMnZoMFFsTVlxdTdBTzRJUWthR1Y2UXJvb0ZP?=
 =?utf-8?B?L2Vsa2VmY0RBdU9GSXlzaVd6alZPZkkxZ1VCT2o1czIwem56YjkvcUxCbHlH?=
 =?utf-8?B?aysvRi9ZbURXYXFaRFlldVM4QlpKMW1QTHFObERUL0xnOEJJcTRCUldocWFj?=
 =?utf-8?B?eHV5YldBWXJ3VFU3TFRibmdjcXZXN1JjZ2tJeStiUSt5WE9QS0toaFQzQjN3?=
 =?utf-8?B?c092d3F4SFN6cUZ3OE04RFpsRlQxZk9Dc3R5Zlc1bk9zR3JxZ1JyWWVEZVpq?=
 =?utf-8?B?cDczY01nQlZxaFd5azlGOTE3L3FDWkhIZkh6Q2dSMWRsMzFzb1JZUlYyZmls?=
 =?utf-8?B?bFpnbExNTngweEpzVkw1U1dGcE01VXZmcVlJdnkwTS9iNE9odVhNZDA1L1RM?=
 =?utf-8?B?bHhzYWV2c3dpNEx5bFpiWFg4TEVwU0ZnTittRlMrQnNjRFkvd0pVbmppbjRZ?=
 =?utf-8?B?TGZ4N3kyWEJMTWd5eE0wV1RwekM3TUVBWXdWclJhMXc0ZllCcDYwbDNPQ2py?=
 =?utf-8?B?OVZUODFnaHk4NEJUNDh5SkRIYlVoWVIvVy9qMEpCdmQ4a2pUL2J3VkxUUmlM?=
 =?utf-8?B?aGpTaGlPK3d6TUVFbitWZ284N2wvMnQwVG9wR1hheUVzRVBSWTlJR2VHaWZk?=
 =?utf-8?B?SFZUSzdJVDMwSzJIUjFBek5xdHNtOVcrWjNucjc3UVJiTVpXNjJZeHhndkxv?=
 =?utf-8?B?cklaVjQ0K0VxaEJMZDFuMTVsUVp6YWpuZHprZ211TUdXREUvL1pFYVlra09m?=
 =?utf-8?B?VysrS3FzdTl3UHNZRER6QzdxVUEvNlBKR1l2Nk5xdjhDRUVzRnRYWUo5c0pr?=
 =?utf-8?B?Q2ZoSThWSG85QmMwekJHS0JlaDl6S3B0ZTA1TjFiVXlBcUlhNmZzaThLUDB3?=
 =?utf-8?B?TkRYS0tOZW5WRmw1bTVlZmdkZWQ5WFRGRkt5YjRsTkJCdGJhUjd0dkFyeTVB?=
 =?utf-8?B?MVBUWkwvRk5UallDbzZxSTFxU3FSeTZlYlNhNllTZkFtUWVRM2xJbldCdTNO?=
 =?utf-8?B?STR4MFVVZzRXYVJ0MFQ4aGlTaVZrb05OTzJZQ3FPOEhVYjJrRVRRUHhmVGVR?=
 =?utf-8?B?bW50aHRGVkVmNW5xc2hZT3dnWTBXcFlqaHoxKzNFdVg3aEhCSjBoNGFmbjdj?=
 =?utf-8?B?bm5DS3I1WVBINlVyWjFXQTRMQmpjNlBsVUlvWXpacjlDUitudmtMK0R0ajY4?=
 =?utf-8?B?OEdDTFlQbC9GNm1TVUYxK1EwZ0YrL1lSR2pGY21XRGVFY2xhTkhRaW80NlRM?=
 =?utf-8?B?b1dMM3FNVWhEeUROV2ZZTEVNQkNCbU8weHJhMnExTlB2cWVHbWRsWDVBdjBO?=
 =?utf-8?B?WDNINWNOSVlRYjZhZjk0aXFzTGhaVnEwVFd3cGdlUGFjaENvakxvN0U2dVho?=
 =?utf-8?B?RldzR3YyeXpFem5ockFKUGtUOUpKc1lQbEVvUXpoODc2aWVCUCtpcTNMZjd1?=
 =?utf-8?B?T2ZEQ0IwL3FsMlI2TEFzSmZtOUNrVDBJRGlPUG9ic1IwLytnUi9NWjF4bm80?=
 =?utf-8?B?VFJ4SnRaM1lqK2U2VXZYTEk1V05mYnNYTTlTL1FJbis0ZzhqSGRZd1ZGT2F6?=
 =?utf-8?B?TmZFc01HVGljOU4rNFhlSVlMc1FRUVJKdkg5WHV3UjVYNnpGR293L1ZhUk5H?=
 =?utf-8?B?Qk42emJaVEYvbWlST0Zmb1hCU2JXY2laNnR4SHVNbDVSYllsVERuS3o0bmZx?=
 =?utf-8?B?Ui9HeitsQjF5WEF2eUVidlBYYXVmNGI0RDF0cEtxQ1dCT05tbXdXM0pQN1Nh?=
 =?utf-8?B?NXZlcTJLYU1qdEh0SW85TWw5UHBSSnU4ejJESlJvRTdVK0Q5cGluQ1JSTUxu?=
 =?utf-8?B?eG44WkVJSGd4bFgzeW1BM0xCN09QQ0o0KzdFcDBUc0dPTk85TUdqN1NXQWV3?=
 =?utf-8?B?NWcrK2hITUJiem9xMzhRZ3VTblF1bzVKZ2dPVWw3ZzVoK1FKQ001MTk4MnhW?=
 =?utf-8?B?c0NuT3g2KzFJU3VIWFRmU05jUnJuY0loTG4wRVVsZk5kcHZwek5Nd1Jaai9W?=
 =?utf-8?B?emQ4b3k2cnYvR1g0N3ZFVndHMTFEYWlieWs2cllTUXJIRndvQ1orcWxNQ0h4?=
 =?utf-8?B?b0VnVXo1bURoNnR0TS92VlQraDhmNGhWY3Y5UElzUUlEWGFnL09MRzYwYXJu?=
 =?utf-8?B?bkNkR2RVREwwT1FXRUM5NjRsUEIrek5rbXdsa1F4ZXk4R0p1TnlTVjRxeUpZ?=
 =?utf-8?B?U1FTMzdhZmswWVhMUGo1ZkhWRTdaUGs4YXZwYkllK2pGdHV6RGsxanBYQ2dX?=
 =?utf-8?B?MExKeFFDOVZGdXJwOHBFNkd4Qk9jaWdWeFNsZUI3QnZCTmx3VFpnL2FnRWRQ?=
 =?utf-8?B?bm50eDlTMGhxUTA0bTh4Y1U2SE80SHEvbHVkdGlhM2FtR240dVprbi9HMHUy?=
 =?utf-8?Q?K7ZFAugoEgI/EdtBp140x0qis3YB+fOddoEPGodo/t3RA?=
X-MS-Exchange-AntiSpam-MessageData-1: A8VSkN7ux5lskQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0241e77d-69e3-40fa-18ec-08df365978f3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:43:22.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sp/xuZu3CqIUeRhkti7QHhbfAqUY+PmO4VSmKRMEgozLlN1doMisW6TIgzKiZK8y3m0XWhhEdAaLJ6SaKyuElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

This series contains patches 5, 6 and 8 from John's r000 series v3 [1]
that prepare the command queue so that the r000 switch applies more
cleanly. They are submitted separately to make review and merging
faster, and because they are also valuable even without the r000 switch.

Patch 1 is a drive-by fix of the `NV_PFSP` register declarations that is
included here as the `NV_PGSP` declarations mirror the `NV_PFSP` ones.

No functional change is introduced by this series.

Applies cleanly on `drm-rust-next`, and runtime-tested successfully on
Ampere.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (1):
      gpu: nova-core: fix stride of NV_PFSP_* registers

John Hubbard (3):
      gpu: nova-core: regs: add msgq v2 BAR0 register declarations
      gpu: nova-core: gsp: cmdq: ring the GSP doorbell from the queue memory
      gpu: nova-core: gsp: cmdq: compute the queue regions from a count and a slot

 drivers/gpu/nova-core/gsp/cmdq.rs | 146 +++++++++++++++++++-------------------
 drivers/gpu/nova-core/gsp/regs.rs |  22 +++++-
 drivers/gpu/nova-core/regs.rs     |   8 +--
 3 files changed, 99 insertions(+), 77 deletions(-)
---
base-commit: 9b840ed71d34ff545e3ada8be2ad5daaae542b50
change-id: 20261030-r000-cmdq-prep-6c5644619c11

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

