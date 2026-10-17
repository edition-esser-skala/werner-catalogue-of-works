\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8^\aTre c' h a e'2~
    e8 c h8. h16 a8 c h16([ c)] d8
    g,4. c8 h c4 h8
    c e d h c16[ d] e[ d] c8. c16
  }
}

SopranoLyricsA = \lyricmode {
  Je -- su re -- dem --
  ptor o -- mni -- um quem lu -- cis
  an -- te o -- ri -- gi --
  nem pa -- rem Pa -- ter -- nae glo -- "ri -"
}

SopranoLyricsB = \lyricmode {
  Me -- men -- to re --
  rum con -- di -- tor no -- stri quod
  o -- lim cor -- _ po --
  ris sa -- cra -- ta~ab al -- vo Vir -- "gi -"
}

SopranoLyricsC = \lyricmode {
  Je -- su ti -- bi __
  sit glo -- ri -- a qui na -- tus
  es de Vir -- _ gi --
  ne cum Pa -- tre~et al -- mo Spi -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2^\aTre r8 a' gis a
    h a \appoggiatura a gis8. gis16 a8 a a16([ g)] g([ f)]
    e4 d8 e16([ fis)] g8 e d8. d16
    e8 e fis gis a h a8. a16
  }
}

AltoLyricsA = \lyricmode {
  Je -- su re --
  dem -- ptor o -- mni -- um quem lu -- cis
  an -- te, an -- te o -- ri -- gi --
  nem pa -- rem Pa -- ter -- nae glo -- "ri -"
}

AltoLyricsB = \lyricmode {
  Me -- men -- to
  re -- rum con -- di -- tor no -- stri quod
  o -- lim, quod o -- lim cor -- po --
  ris sa -- cra -- ta~ab al -- vo Vir -- "gi -"
}

AltoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri -- a qui na -- tus
  es, na -- tus es de Vir -- gi --
  ne cum Pa -- tre~et al -- mo Spi -- "ri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r8 c h a
    gis a d e a,4 r
    r8 c h a g a f g
    c, c' h h a gis a8. a16
  }
}

TenoreLyricsA = \lyricmode {
  Je -- su re --
  dem -- ptor o -- mni -- um
  quem lu -- cis an -- te~o -- ri -- gi --
  nem pa -- rem Pa -- ter -- nae glo -- "ri -"
}

TenoreLyricsB = \lyricmode {
  Me -- men -- to
  re -- rum con -- di -- tor
  no -- stri quod o -- lim cor -- po --
  ris sa -- cra -- ta~ab al -- vo Vir -- "gi -"
}

TenoreLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri -- a
  qui na -- tus es de Vir -- gi --
  ne cum Pa -- tre~et al -- mo Spi -- "ri -"
}

Organo = {
  \relative c {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a'4^\aTre g8 f e c' h a
    gis a d e a, f g h
    c, c' h a g a f g
    c, c' h4 a8 gis a4
  }
}

BassFigures = \figuremode {
  r2 <_+>8 <6> <6\\ 4> <8 \t>
  r4 <6 5>8 <_+>4 <5 3>8 <9> <6>
  r4 r8 <5>16 <6\\> r4 <6 5>
  r <5\+>8 <6\\>4 r4.
}

\score {
  <<
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
