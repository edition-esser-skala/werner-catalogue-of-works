\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d'1~^\markup \remark "stendato"
    d~
    d
    c~
    c2 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b'1^\markup \remark "stendato"
    a
    b
    g
    a2 g
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'1^\markup \remark "stendato"
    d
    d
    e
    c2 cis
  }
}

Soli = {
  \relative c' {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Gerechtigkheit" r8 g b b b d
    d a \clef soprano r8^\part "Barmherzigkheit" d' d a a c
    b4 r8 g \hA b b d \hA b
    g4 r8 c e e g b,
    a4 \clef alto a,8^\part "Der verlohrene Sohn" h! cis8. cis16 cis8 d
  }
}

SoliLyrics = \lyricmode {
  So mueß ich gänz -- lich
  wei -- chen? Hier fün -- de -- ſtu nicht
  ſtatt, weill nichts als Lieb und
  Gnad die Bueß ver -- die -- net
  hat. Ô wie ſchmer -- tzens -- voll hab
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'1
    fis
    g
    e
    f2 e
  }
}

BassFigures = \figuremode {
  <_->1
  r
  <_->
  <6>
  r2 <6\\>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
