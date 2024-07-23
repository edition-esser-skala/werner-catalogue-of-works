\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'2 h g4 c~
    c h8 a h4 h a d~
    d h e2. dis4
    e h c a d h~
    h g e1
    R1.
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.
    r2 e fis
    d4 g2 fis8 e fis4 fis
    e2. fis2 g4~
    g fis8 e a2. gis4
    a2 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \phrasingSlurDashed a'2 h g4 c
    c h8[ a] h4 h a d
    d h e2. dis4
    e h c a d h~
    h g e1
    R1.
  }
}

SopranoLyricsA = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- _ tor, hu --
  ma -- nae sa -- _
  tor, hu -- ma -- nae sa -- _
  _ tor,
}

SopranoLyricsB = \lyricmode {
  Qua vi -- ctus es __
  _ cle -- men -- ti -- a, es __
  _ cle -- men -- ti --
  a, qua vi -- ctus es, vi --
  ctus es,
}

SopranoLyricsC = \lyricmode {
  Tu dux ad a --
  stra et se -- mi -- ta, a --
  stra et se -- mi --
  ta, ad a -- stra et se --
  mi -- ta,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.
    r2 e fis
    d4 g2 fis8[ e] fis4 fis
    e2. fis2 g4
    g fis8[ e] a2. gis4
    a2 r r
  }
}

AltoLyricsA = \lyricmode {
  Sa -- lu --
  tis hu -- ma -- nae sa --
  tor, hu -- ma --
  _ nae sa -- _
  tor,
}

AltoLyricsB = \lyricmode {
  Qua vi --
  ctus es cle -- men -- ti --
  a, vi -- ctus __
  _ cle -- men -- ti --
  a
}

AltoLyricsC = \lyricmode {
  Tu dux
  ad a -- stra se -- mi --
  ta, ad a --
  stra et se -- mi --
  ta,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*3
    r2 a h
    g4 c2 h8[ a] h4 h
    a d2 h4 e2
  }
}

TenoreLyricsA = \lyricmode {
  Sa -- lu --
  tis hu -- ma -- nae sa --
  tor, sa -- tor, "sa -"
}

TenoreLyricsB = \lyricmode {
  Qua vi --
  ctus es cle -- men -- ti --
  a, es cle -- "men -"
}

TenoreLyricsC = \lyricmode {
  Tu dux
  ad a -- stra~et se -- mi --
  ta, a -- stra et
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*4
    r2 r e
    fis d4 g2 fis8[ e]
  }
}

BassoLyricsA = \lyricmode {
  Sa --
  lu -- tis hu -- "ma -"
}

BassoLyricsB = \lyricmode {
  Qua
  vi -- ctus es "cle -"
}

BassoLyricsC = \lyricmode {
  Tu
  dux ad a -- stra~et
}

Organo = {
  \relative c {
    \clef soprano
    \key a \minor \time 3/2 \tempoMarkup "[no tempo]"
    << {
      a''2 h g4 c~
      c h8 a h4 h a d~
      d h e2. dis4
      e2
    } \\ {
      s1.
      s2 e, fis
      d4 g2 fis8 e fis2
      e
    } >> \clef tenor a, h
    g4 c2 h8 a \clef bass e2
    fis d4 g2 fis8 e
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r2 <5>4 <6\\> <5> <6>
  r <5> <6>2 <4>4 <_+>
  <6>2 r4 <5> <6>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
